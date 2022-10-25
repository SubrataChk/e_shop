import 'dart:io';

import 'package:e_shop/src/service/auth.dart';
import 'package:e_shop/src/widget/custom_button.dart';
import 'package:e_shop/src/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUpPageSection extends StatefulWidget {
  @override
  State<SignUpPageSection> createState() => _SignUpPageSectionState();
}

class _SignUpPageSectionState extends State<SignUpPageSection> {
  // const SignUpPageSection({super.key});
  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

  TextEditingController _confirmPassword = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ImagePicker _imagePicker = ImagePicker();

  XFile? images;

  getImages() async {
    images = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      images;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Text(
                  "Create New Account",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    getImages();
                  },
                  child: CircleAvatar(
                    radius: 80.r,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        images == null ? null : FileImage(File(images!.path)),
                    child: images == null
                        ? Icon(
                            Icons.add_a_photo,
                            size: 30.w,
                            color: Colors.black,
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomTextFormField(
                  hintText: "Name",
                  controller: _name,
                  obsecure: false,
                  prefix: Icons.person),
              CustomTextFormField(
                  hintText: "Email",
                  controller: _email,
                  obsecure: false,
                  prefix: CupertinoIcons.mail),
              CustomTextFormField(
                  hintText: "Password",
                  controller: _password,
                  obsecure: false,
                  prefix: Icons.vpn_key),
              CustomTextFormField(
                  hintText: "Confirm Password",
                  controller: _confirmPassword,
                  obsecure: true,
                  prefix: Icons.vpn_key),
              authService.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      onTap: () {
                        authService.createAccount(
                            name: _name,
                            email: _email,
                            password: _password,
                            confirmpassword: _confirmPassword,
                            file: images!);
                      },
                      title: "Create")
            ],
          ),
        ),
      )),
    );
  }
}
