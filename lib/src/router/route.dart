// const String splash = "/splash_screen";
// const String onboarding = "/onboarding_screen";
import 'package:e_shop/src/view/auth/login.dart';
import 'package:e_shop/src/view/auth/sign_up.dart';
import 'package:e_shop/src/view/home/home.dart';
import 'package:get/get.dart';

const String signup = "/signup_screen";
const String login = "/login_screen";
// const String userForm = "/userForm_screen";
// const String privacy = "/privacy_screen";
// const String bottomNav = "/bottomNav_screen";
// //Drawer Section
// const String support = "/support_screen";
// const String privacySection = "/privacySection_screen";
// const String faqSection = "/faqSection_screen";
// const String rateUs = "/rateUs_screen";
// const String howToUse = "/howToUse_screen";
// const String setting = "/setting_screen";
// const String search = "/search_screen";
// const String details = "/details_screen";
// const String lastStep = "/lastStep_screen";
// const String seeAll = "/seeAll_screen";
// const String profileUpdate = "/profileUpdate_screen";
const String homePage = "/homePage_screen";

List<GetPage> getPages = [
  GetPage(name: login, page: () => LoginPage()),
  GetPage(name: signup, page: () => SignUpPageSection()),
  GetPage(name: homePage, page: () => HomePage()),
];
