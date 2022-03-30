import 'package:candle/bindings.dart';
import 'package:candle/ui/home_screen.dart';
import 'package:candle/viewmodels/base_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends BaseViewmodel {
  bool changePharmacy = false;
  bool _autoValidate = false;
  bool rememberMe = false;
  String email;
  String password;
  String displayName;
  String phone;
  String errorMsg;
  BuildContext context;
  var authuser;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void validateRegisterInput() async {
    try {
      var auth = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(auth);

      await FirebaseAuth.instance.currentUser
          .updateProfile(photoURL: phone, displayName: displayName);
      final firestoreInstance = FirebaseFirestore.instance;
      firestoreInstance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({});
      Get.to(HomePage(), binding: CandleBindings());
    } catch (error) {
      switch (error.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          {
            errorMsg = "This email is already in use.";
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        case "ERROR_WEAK_PASSWORD":
          {
            errorMsg = "The password must be 6 characters long or more.";
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        case "ERROR_INVALID_EMAIL":
          {
            errorMsg = "Invalid email formate.";

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        default:
          {}
      }
    }
  }

  void validateLoginInput() async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(user);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (rememberMe) {
        prefs.setString('email', email);
        prefs.setString('password', password);
      } else {
        prefs.setString('email', "");
        prefs.setString('password', "");
      }
      authuser = await FirebaseAuth.instance.currentUser;
      Get.to(HomePage(), binding: CandleBindings());
    } catch (error) {
      switch (error.code) {
        case "ERROR_USER_NOT_FOUND":
          {
            errorMsg = "There is no user with such entries. Please try again.";

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        case "ERROR_WRONG_PASSWORD":
          {
            errorMsg = "Password doesn\'t match your email.";

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        case "ERROR_INVALID_EMAIL":
          {
            errorMsg = "Email doesn\'t exists.";

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        default:
          {}
      }
    }
  }
}
