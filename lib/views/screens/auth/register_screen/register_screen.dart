import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../logic/cubit/select_gender_cubit/select_gender_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_font_styles.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/component_alert.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/register_screen";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectGenderCubit("Gender"),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Registration",
                      style: AppTextStyle().titleM(color: AppColors().primaryRed)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: Image.asset(AppImages.logo),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 10,
              ),
              _buildPhoneInputPage(context)
              // _buildOTPInputPage(context)
            ],
          ),
        ),
      ),
    );
  }

  _buildPhoneInputPage(BuildContext context) {
    return BlocBuilder<SelectGenderCubit, String>(
      builder: (contextCubit, state) {
        var selectGenderCubit = contextCubit.read<SelectGenderCubit>();
        return Column(
          children: [
            SizedBox(
              height: 15.px,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 20.px, right: 5.px, top: 10.px, bottom: 10.px),
                  child: AppTextField.appTextField(
                    context,
                    hintText: "FirstName",
                    padding:
                        EdgeInsets.only(left: 20.px, right: 20.px, top: 1.px),
                    width: MediaQuery.of(context).size.width / 2.3,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: 20.px, left: 5.px, top: 10.px, bottom: 10.px),
                  child: AppTextField.appTextField(
                    context,
                    hintText: "LastName",
                    padding:
                        EdgeInsets.only(left: 20.px, right: 20.px, top: 1.px),
                    width: MediaQuery.of(context).size.width / 2.3,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 10.px, bottom: 10.px),
              child: AppTextField.appTextField(context,
                  hintText: selectGenderCubit.value,
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: AppColors().grey,
                  ),
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors().grey,
                  ),
                  readOnly: true, onTap: () {
                ComponentAlert.appAlertCustomDialog(
                    context: context,
                    title: "Gender",
                    isFirstButton: true,
                    isSecondButton: true,
                    isThirdButton: true,
                    titleFirstButton: "Male",
                    titleSecondButton: "Female",
                    titleThirdButton: "Other",
                    dialogHeight: MediaQuery.of(context).size.width / 1.6,
                    onFirstButtonTap: () {
                      selectGenderCubit.onSelectGender("Male");
                      Navigator.pop(context);
                    },
                    onSecondButtonTap: () {
                      selectGenderCubit.onSelectGender("Female");
                      Navigator.pop(context);
                    },
                    onThirdButtonTap: () {
                      selectGenderCubit.onSelectGender("Other");
                      Navigator.pop(context);
                    });
              }

                  // padding: EdgeInsets.only(left: 20.px,top: 2.px),

                  ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 10.px, bottom: 10.px),
              child: AppTextField.appTextField(
                context, hintText: "Email",

                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors().grey,
                ),

                // padding: EdgeInsets.only(left: 20.px,top: 2.px),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 10.px, bottom: 10.px),
              child: AppTextField.appTextField(
                context, hintText: "+85512345678",
                readOnly: true,
                prefixIcon: Icon(
                  Icons.phone,
                  color: AppColors().grey,
                ),

                // padding: EdgeInsets.only(left: 20.px,top: 2.px),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 10.px, bottom: 10.px),
              child: AppTextField.appTextField(
                context, hintText: "Password",
                isObsecure: true,

                suffixIcon: Icon(Icons.remove_red_eye_outlined,
                    color: AppColors().grey),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppColors().grey,
                ),

                // padding: EdgeInsets.only(left: 20.px,top: 2.px),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 10.px, bottom: 10.px),
              child: AppTextField.appTextField(
                context, hintText: "Confirm Password",
                isObsecure: true,

                suffixIcon: Icon(Icons.remove_red_eye_outlined,
                    color: AppColors().grey),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppColors().grey,
                ),

                // padding: EdgeInsets.only(left: 20.px,top: 2.px),
              ),
            ),
            GestureDetector(
              onTap: () {
                ComponentAlert.alertDialogSuccess(
                    context: context, title: "Success", titleButton: "OK");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 25.px, vertical: 20.px),
                    height: 50.px,
                    width: MediaQuery.of(context).size.width / 2.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors().primaryRed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Register',
                      style: AppTextStyle().titleS(color: AppColors().white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5.px,
            ),
            GestureDetector(
              onTap: () {
                // Get.to(RegisterPage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account?",
                    style: AppTextStyle().textM(),
                  ),
                  SizedBox(
                    width: 5.px,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.routeName, (route) => false);
                    },
                    child: Text(
                      "Login",
                      style: AppTextStyle().titleM(color: AppColors().primaryRed),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.px),
          ],
        );
      },
    );
  }
}
