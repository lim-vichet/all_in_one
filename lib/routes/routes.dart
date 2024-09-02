
import '../views/screens/accesstoken/accesstoken.dart';
import '../views/screens/auth/login_screen/login_screen.dart';
import '../views/screens/auth/login_screen/otp_screen.dart';
import '../views/screens/auth/register_screen/register_screen.dart';
import '../views/screens/home_screen/home_screen.dart';
import '../views/screens/main_screen/main_screen.dart';
import '../views/screens/notification/notification_screen/notification_screen.dart';
import '../views/screens/splash_screen/splash_screen.dart';
import '../views/screens/test_auth/signup.dart';


final routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  OTPScreen.routeName: (context) => const OTPScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  MyHomePage.routeName: (context) => MyHomePage(),




  // Test Scraan

};
