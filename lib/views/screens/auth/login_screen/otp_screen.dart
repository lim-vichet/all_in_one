
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_font_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
class OTPScreen extends StatefulWidget {
  static String routeName = 'OTPScreen';
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  var verificationId = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> fetchOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+85590290544',
      verificationCompleted: (PhoneAuthCredential credential) {
        signInWithPhone(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if(e.code == 'invalid-phone-number'){
          print("error");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
      },
    );
  }

  Future<void> signInWithPhone (PhoneAuthCredential phoneAuthCredential) async {
    try{
        final AuthCredential = await auth.signInWithCredential(phoneAuthCredential);
        if(AuthCredential.user != null){
          print("ok kon papa");
        }
    }
    catch(e){
      print("Error!!!!");
    }
  }

@override
void initState() {
    // TODO: implement initState
    super.initState();
    fetchOTP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 760,
              color: Colors.blue,
              child: const Image(
                image: AssetImage(
                  "assets/images/bg_login.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        // color: Colors.deepOrange,
                        child: Image(
                          image: AssetImage("assets/images/logo_app.png"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        // color: Colors.lightBlue,
                          child: Text(
                            "Input OTP Code To \n Get More Option",
                            textAlign: TextAlign.left,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        cursorColor: AppColors().black,
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        // controller: phoneController,
                        onChanged: (phone) {
                        },
                        decoration: InputDecoration(
                          hintText: " +855 ",
                          alignLabelWithHint: true,
                          isDense: true,
                          label: Text(
                            "Please input your Phone Number",
                            style: AppTextStyle().textS(fontSize: 15),
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
                ))
          ],
        ),
      )
    );
  }
}
