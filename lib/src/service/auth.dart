import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/src/model/user.dart';
import 'package:e_shop/src/router/route.dart';
import 'package:e_shop/src/service/storage/storage.dart';
import 'package:e_shop/src/widget/show_msg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthService extends ChangeNotifier {
  bool isLoading = false;
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(AuthService.pattern.toString());

  createAccount({
    required TextEditingController name,
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController confirmpassword,
    required XFile file,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      final User? firebaseUser = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: email.text.trim(), password: password.text.trim())
              .catchError((e) {
        isLoading = false;
        notifyListeners();
        showMessage(e.toString());
      }))
          .user;

      isLoading = true;
      notifyListeners();

      if (firebaseUser!.uid != null) {
        String photoUrl =
            await StorageMethod().profileImage("profileImage", file);

        Map<String, dynamic> userData = {
          "uid": firebaseUser.uid,
          "name": name.text.trim(),
          "email": email.text.trim(),
          "image": photoUrl,
          "password": password.text.trim(),
          "confirmpassword": confirmpassword.text.trim(),
        };

        FirebaseFirestore.instance
            .collection("user_info")
            .doc(firebaseUser.uid)
            .set(userData);

        isLoading = false;
        notifyListeners();
        Get.toNamed(homePage);
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      showMessage(e.toString());
    }
  }
}
