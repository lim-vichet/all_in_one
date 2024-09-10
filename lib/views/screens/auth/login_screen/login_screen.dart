import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../logic/bloc/login_bloc/login_bloc.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_dialog.dart';
import '../../../../utils/constants/app_font_styles.dart';
import '../../../../utils/global_use.dart';
import '../../accesstoken/accesstoken.dart';
import '../../home_screen/home_screen.dart';
import '../../main_screen/main_screen.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    log("ContentContent $idTokenFirebase \n\n\n\n");
    super.initState();
  }

  bool checkEmail = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if(state is LoginInError){
              AppDialog.alertDialogFailed(context, onButtonTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
            }
            else if(state is LoginInLoading){
              AppDialog.loadingDialog(context);
            }
            else if(state is LoginInSuccess){
              Future.delayed(Duration(seconds: 5), (){
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(context, MainScreen.routeName);
              });

            }
            else if(state is LoginEmailSuccess){
              Future.delayed(Duration(seconds: 5), (){
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(context, MainScreen.routeName);
              });
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 835,
                    color: Colors.blue,
                    child: const Image(
                      image: AssetImage(
                        "assets/images/bg_login.jpg",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 10,
                    child: Container(
                      width: 250,
                      height: 80,
                      // color: Colors.lightBlueAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Welcome !!!", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold, fontSize: 18),),
                          Row(
                            children: [
                              Text("Please "),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    checkEmail = true;
                                  });
                                },
                                  child: Text("E-mail", style: TextStyle(color: Colors.lightBlueAccent),)
                              ),
                              Text(" or "),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    checkEmail = false;
                                  });
                                },
                                  child: Text("Phone", style: TextStyle(color: Colors.lightBlueAccent),)
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ),
                  Positioned(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 150,
                          height: 150,
                          // color: Colors.deepOrange,
                          child: Image(
                            image: AssetImage("assets/images/logo_app.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Register E-Comerce App to Experience All\nMobile App Feature",
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        checkEmail?
                        /// E-mail
                        Column(
                          children: [
                            TextField(
                              cursorColor: AppColors().black,
                              // keyboardType: TextInputType.number,
                              autofocus: true,
                              controller: emailController,
                              onChanged: (phone) {
                                // context.read<LoginBloc>().add(ValidateEvent(phone: phone));
                              },
                              decoration: InputDecoration(
                                hintText: " @ E-Mail ",
                                alignLabelWithHint: true,
                                isDense: true,
                                label: Text(
                                  "Please Input Your E-mail",
                                  style: AppTextStyle().textS(fontSize: 15, color: Colors.grey.withOpacity(0.8)),
                                ),
                                hintStyle: TextStyle(
                                  color: AppColors().grey,
                                ),
                                prefixIcon: Container(
                                    width: 40,
                                    height: 40,
                                    margin:
                                    EdgeInsets.fromLTRB(4.px, 4.px, 10, 4.px),
                                    decoration: BoxDecoration(
                                        color: AppColors().bgDetailIcons,
                                        borderRadius: BorderRadius.all(Radius.circular(20.px))),
                                    child: Icon(
                                      Icons.email,
                                      color: AppColors().white,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors().bgDetailIcons, width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.px),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors().bgDetailIcons, width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.px),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              cursorColor: AppColors().black,
                              // keyboardType: TextInputType.number,
                              autofocus: true,
                              controller: passwordController,
                              onChanged: (phone) {
                                // context.read<LoginBloc>().add(ValidateEvent(phone: phone));
                              },
                              decoration: InputDecoration(
                                hintText: " ...................................................... ",
                                alignLabelWithHint: true,
                                isDense: true,
                                label: Text("Please Input Your PassWord", style: AppTextStyle().textS(fontSize: 15, color: Colors.grey.withOpacity(0.8)),
                                ),
                                hintStyle: TextStyle(
                                  color: AppColors().grey,
                                ),
                                prefixIcon: Container(
                                    width: 40,
                                    height: 40,
                                    margin:
                                    EdgeInsets.fromLTRB(4.px, 4.px, 10, 4.px),
                                    decoration: BoxDecoration(
                                        color: AppColors().bgDetailIcons,
                                        borderRadius: BorderRadius.all(Radius.circular(20.px))),
                                    child: Icon(
                                      Icons.password,
                                      color: AppColors().white,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors().bgDetailIcons, width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.px),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors().bgDetailIcons, width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.px),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              width: double.infinity,
                              height: 40,
                              // color: Colors.lightBlue,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        color: Colors.transparent,
                                      )),
                                  InkWell(
                                    onTap: () {
                                      context.read<LoginBloc>().add(EventLoginEmail( email: emailController.text, password: passwordController.text));
                                    },
                                    child: Expanded(
                                        flex: 1,
                                        child: Container(
                                          // color: Colors.pink,
                                          child: Icon(
                                            Icons.arrow_circle_right,
                                            size: 50,
                                            color: AppColors().bgDetailIcons,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ):

                        /// Phone
                        Column(
                          children: [
                            TextField(
                              cursorColor: AppColors().black,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              controller: phoneController,
                              onChanged: (phone) {
                                // context.read<LoginBloc>().add(ValidateEvent(phone: phone));
                              },
                              decoration: InputDecoration(
                                hintText: " +855 ",
                                alignLabelWithHint: true,
                                isDense: true,
                                label: Text(
                                  "Please input your Phone Number",
                                  style: AppTextStyle().textS(fontSize: 15, color: Colors.grey.withOpacity(0.8)),
                                ),
                                hintStyle: TextStyle(
                                  color: AppColors().grey,
                                ),
                                prefixIcon: Container(
                                    width: 40,
                                    height: 40,
                                    margin:
                                    EdgeInsets.fromLTRB(4.px, 4.px, 10, 4.px),
                                    decoration: BoxDecoration(
                                        color: AppColors().bgDetailIcons,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.px))),
                                    child: Icon(
                                      Icons.call,
                                      color: AppColors().white,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors().bgDetailIcons, width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.px),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors().bgDetailIcons, width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.px),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              width: double.infinity,
                              height: 40,
                              // color: Colors.lightBlue,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        color: Colors.transparent,
                                      )),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.pushNamed(context, OTPScreen.routeName);
                                      // Navigator.pushNamed(context, TestOTPCutSpace.routeName);
                                      Navigator.pushNamed(context, MainScreen.routeName);
                                      // Navigator.pushNamed(context, MyHomePage.routeName);
                                      // context.read<LoginBloc>().add(EventLogin(phone: phoneController.text, language: 'EN'));
                                    },
                                    child: Expanded(
                                        flex: 1,
                                        child: Container(
                                          // color: Colors.pink,
                                          child: Icon(
                                            Icons.arrow_circle_right,
                                            size: 50,
                                            color: AppColors().bgDetailIcons,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
