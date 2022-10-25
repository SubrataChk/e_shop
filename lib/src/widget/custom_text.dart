import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefix;
  final bool obsecure;
  final String hintText;

  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.obsecure,
      required this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: TextFormField(
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(prefix),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              contentPadding: EdgeInsets.all(15.r))),
    );
  }
}
