import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;



class MyHomePage extends StatefulWidget {
  static String routeName = 'MyHomePage';

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String accessToken = '';
  getToken() async {
    var mytoken = await FirebaseMessaging.instance.getToken();
    print("My Device Token: ${mytoken}");
  }
  @override
  void initState() {
    getToken();
    super.initState();
    getAccessToken();
  }
  Future<void> getAccessToken() async {
    try {
      final serviceAccountJson = await rootBundle.loadString(
          'assets/all-in-one-app-8277f-firebase-adminsdk-sq9n3-de6129c2df.json');

      final accountCredentials = ServiceAccountCredentials.fromJson(json.decode(serviceAccountJson),);
      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
      final client = http.Client();
      try {
        final accessCredentials = await obtainAccessCredentialsViaServiceAccount(accountCredentials, scopes, client,);
        setState(() {accessToken = accessCredentials.accessToken.data;});
        print('Access Token: $accessToken');
      } catch (e) {
        print('Error obtaining access token: $e');
      } finally {
        client.close();
      }
    } catch (e) {
      print('Error loading service account JSON: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Access Token Example'),
      ),
      body: Center(
        child: Text('Access Token: $accessToken'),
      ),
    );
  }
}
