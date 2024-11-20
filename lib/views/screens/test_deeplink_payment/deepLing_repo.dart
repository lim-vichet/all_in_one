import 'dart:convert';
import 'package:http/http.dart' as http;

class DeepLinkRepository {
  Future<Map<String, dynamic>> fetchDeepLinkData() async {
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));

    // Example API response
    return {
      "status": {
        "code": 0, "errorCode": null, "errorMessage": "SUCCESS"},
      "data": {
        "app_deeplink": "QUFFQlFRd0FBQUFRQUFBQU9BQUFBQllBQUFBak5KOUY2UVRha005L2h5RklvU1ZQT25ZTkZXa3R3a0tmWDFxWS9zb0VBQkFBVG53cFpTTHB1Zm9qNG8wWkxSNGVuQmxVRnMzSUVsMjUzU2I4UjlMMmR6dXRmV0RPcjB5ejdiSlBWOUtmWS8wVy9qRDNyS3dzMm1yZmE4UGx0RCs3RXBPdm5aMEFKQkJ4",
        "app_store": "https://apps.apple.com/kh/app/mohanokor-mobile/id1598274010",
        "play_store": "https://play.google.com/store/apps/details?id=com.mohanokor.mobileapp",
      }
    };
  }
}
