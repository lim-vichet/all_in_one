import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'deepLing_repo.dart';

class DeepLinkState {
  final bool isLoading;
  final String? statusMessage;
  final String? qrString;
  final String? appStoreUrl;
  final String? playStoreUrl;

  DeepLinkState({
    this.isLoading = false,
    this.statusMessage,
    this.qrString,
    this.appStoreUrl,
    this.playStoreUrl,
  });

  DeepLinkState copyWith({
    bool? isLoading,
    String? statusMessage,
    String? qrString,
    String? appStoreUrl,
    String? playStoreUrl,
  }) {
    return DeepLinkState(
      isLoading: isLoading ?? this.isLoading,
      statusMessage: statusMessage ?? this.statusMessage,
      qrString: qrString ?? this.qrString,
      appStoreUrl: appStoreUrl ?? this.appStoreUrl,
      playStoreUrl: playStoreUrl ?? this.playStoreUrl,
    );
  }
}

class DeepLinkCubit extends Cubit<DeepLinkState> {
  final DeepLinkRepository _repository;

  DeepLinkCubit(this._repository) : super(DeepLinkState());

  Future<void> fetchAndOpenDeepLink({required TargetPlatform platform}) async {
    emit(state.copyWith(isLoading: true, statusMessage: 'Fetching data...'));
    try {
      final data = await _repository.fetchDeepLinkData();
      final qrString = data['data']['qrString'];
      final appStoreUrl = data['data']['app_store'];
      final playStoreUrl = data['data']['play_store'];

      emit(state.copyWith(
        isLoading: false,
        statusMessage: 'Data fetched successfully.',
        qrString: qrString,
        appStoreUrl: appStoreUrl,
        playStoreUrl: playStoreUrl,
      ));

      await _openDeepLink(
        appDeeplink: data['data']['app_deeplink'],
        appStoreUrl: appStoreUrl,
        playStoreUrl: playStoreUrl,
        platform: platform,
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, statusMessage: 'Failed to open deep link.'));
    }
  }
  Future<void> _openDeepLink({
    required String appDeeplink,
    required String appStoreUrl,
    required String playStoreUrl,
    required TargetPlatform platform,
  }) async {
    final Uri appUri = Uri.parse(appDeeplink);
    final Uri storeUri = Uri.parse(platform == TargetPlatform.iOS ? appStoreUrl : playStoreUrl);

    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
      emit(DeepLinkState(isLoading: false, statusMessage: 'Opened deep link.'));
    } else {
      await launchUrl(storeUri);
      emit(DeepLinkState(isLoading: false, statusMessage: 'Redirected to app store.'));
    }
  }

// Add your deep link opening method here (same as in previous response)
}
