import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links2/uni_links.dart';  // Import uni_links package
import 'package:url_launcher/url_launcher.dart';  // Import for launching the URL

class DeepLinkState {
  final bool isLoading;
  final String? deepLinkMessage;
  final String? errorMessage;

  DeepLinkState({
    this.isLoading = false,
    this.deepLinkMessage,
    this.errorMessage,
  });
}

class DeepLinkCubit extends Cubit<DeepLinkState> {
  DeepLinkCubit() : super(DeepLinkState());

  // Method to fetch the deep link when the app is opened
  Future<void> fetchDeepLink() async {
    emit(DeepLinkState(isLoading: true));

    try {
      // Check if there is an initial deep link when the app is launched
      Uri? initialLink = (await getInitialLink()) as Uri?;
      if (initialLink != null) {
        emit(DeepLinkState(
          isLoading: false,
          deepLinkMessage: 'Received deep link: $initialLink',
        ));
        _openDeepLink(initialLink);
      } else {
        emit(DeepLinkState(isLoading: false, deepLinkMessage: 'No deep link received.'));
      }
    } catch (e) {
      emit(DeepLinkState(
        isLoading: false,
        errorMessage: 'Failed to get deep link: $e',
      ));
    }

    // Listen for deep links while the app is running in the background
    linkStream.listen((String? deepLink) {
      if (deepLink != null) {
        emit(DeepLinkState(deepLinkMessage: 'Received deep link: $deepLink'));
        _openDeepLink(Uri.parse(deepLink));
      }
    });
  }

  // Method to handle opening the deep link or redirecting to the store
  Future<void> _openDeepLink(Uri deepLink) async {
    String appDeeplink = deepLink.toString();
    print("Attempting to open deep link: $appDeeplink"); // Log the deep link

    if (await canLaunch(appDeeplink)) {
      await launch(appDeeplink);
      emit(DeepLinkState(deepLinkMessage: 'Opened deep link.'));
      print("=========== Deep Link===");
    } else {
      print("=========== play.google===");
      // If deep link doesn't work, redirect to Play Store or App Store
      final String storeUrl = deepLink.scheme == 'https'
          ? deepLink.toString()
          : 'https://play.google.com/store/apps/details?id=com.mohanokor.mobileapp';
      print("Redirecting to store: $storeUrl"); // Log the store URL

      if (await canLaunch(storeUrl)) {
        await launch(storeUrl);
        emit(DeepLinkState(deepLinkMessage: 'Redirected to app store.'));
      } else {
        emit(DeepLinkState(errorMessage: 'Cannot open deep link or app store.'));
      }
    }
  }


  // New method to handle the deeplink from your API response
  Future<void> fetchDeeplinkFromAPI() async {
    // Simulate fetching data from an API
    final deeplinkResponse = {
      "status": {
        "code": 0,
        "errorCode": null,
        "errorMessage": "SUCCESS"
      },
      "data": {
        "app_deeplink": "mohanokormobile://mohanokor.com?type=payment&qrcode=QUFFQlFRd0FBQUFRQUFBQU9BQU FBQllBQUFBak5KOUY2UVRha005L2h5RklvU1ZQT25ZTkZXa3R3a0tmWDFxWS9zb0VBQkFBVG53cFpTTHB1Zm9qNG8wWkxSNGVuQmxVRnMzSUVsMjUzU2I4UjlMMmR6dXRmV0RPcjB5ejdiSlBWOUtmWS8wVy9qRDNyS3dzMm1yZmE4UGx0RCs3RXBPdm5aMEFKQkJ4",
        "app_store": "https://apps.apple.com/kh/app/mohanokor-mobile/id1598274010",
        "play_store": "https://play.google.com/store/apps/details?id=com.mohanokor.mobileapp",
      }
    };

    // Extract the app_deeplink from the response
    String? appDeeplink = deeplinkResponse["data"]!["app_deeplink"] as String?;

    if (appDeeplink != null) {
      // Use the app_deeplink to open the app
      Uri deepLink = Uri.parse("$appDeeplink");
      _openDeepLink(deepLink);
    } else {
      emit(DeepLinkState(errorMessage: 'No deeplink available.'));
    }
  }
}
