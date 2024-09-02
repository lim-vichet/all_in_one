import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  static const String routeName = "/account_screen";
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Account"),
      ),
    );
  }
}
