import 'package:e_shop/src/app/app_image.dart';
import 'package:e_shop/src/router/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImage.login, height: 300.h, width: double.infinity),
            CustomTextFormField(
              hintText: "Email",
              obsecure: false,
              controller: _email,
              prefix: CupertinoIcons.mail,
            ),
            CustomTextFormField(
              hintText: "Password",
              obsecure: true,
              controller: _password,
              prefix: Icons.vpn_key,
            ),
            CustomButton(
              title: "Log In",
              onTap: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have a account?"),
                TextButton(
                    onPressed: () {
                      Get.toNamed(signup);
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.sp),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
