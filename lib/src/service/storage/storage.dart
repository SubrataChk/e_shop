import 'dart:io';

import 'package:e_shop/src/widget/show_msg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageMethod {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> profileImage(
    String childName,
    XFile file,
  ) async {
    Reference reference =
        _storage.ref().child(childName).child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = reference.putFile(File(file.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
