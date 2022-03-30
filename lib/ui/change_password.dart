import 'dart:convert';

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:candle/bindings.dart';
import 'package:candle/ui/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ChangePassword> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage("assets/images/_Common/BGs/Bg.jpg"),
              fit: BoxFit.fill,
            )),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  Container(
                    //color: Colors.green,
                    height: MediaQuery.of(context).size.height * 0.050,
                    child: Text('CHANGE PASSWORD',
                        style: GoogleFonts.zillaSlab(
                          textStyle: TextStyle(
                              fontSize:
                                  25 * MediaQuery.textScaleFactorOf(context),
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[50]),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage(
                            "assets/images/_Common/UIElements/Band.png",
                          ),
                          fit: BoxFit.fill),
                      //color: Colors.red
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: AutoSizeTextField(
                          controller: currentPasswordController,
                          fullwidth: true,
                          obscureText: true,
                          minFontSize: 16.0,
                          style: TextStyle(
                              fontSize: 18.0, height: 1.5, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Current Password',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                            //icon: new Icon(Icons.lock,size: 18.0,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage(
                            "assets/images/_Common/UIElements/Band.png",
                          ),
                          fit: BoxFit.fill),
                      //color: Colors.red
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: AutoSizeTextField(
                          controller: newPasswordController,
                          fullwidth: true,
                          obscureText: true,
                          minFontSize: 16.0,
                          style: TextStyle(
                              fontSize: 18.0, height: 1.5, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'New Password',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                            //icon: new Icon(Icons.lock,size: 18.0,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage(
                            "assets/images/_Common/UIElements/Band.png",
                          ),
                          fit: BoxFit.fill),
                      //color: Colors.red
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: AutoSizeTextField(
                          controller: confirmPasswordController,
                          fullwidth: true,
                          obscureText: true,
                          minFontSize: 16.0,
                          style: TextStyle(
                              fontSize: 18.0, height: 1.5, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                            //icon: new Icon(Icons.lock,size: 18.0,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.040,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.070,
                  ),
                  InkWell(
                    onTap: () async {
                      if (confirmPasswordController.text ==
                          newPasswordController.text) {
                        var user = await FirebaseAuth.instance.currentUser;
                        const String API_KEY =
                            "AIzaSyALxzoSKb2j1wTqDbx4NQGAYOGgvzxpywc";
                        final String changePasswordUrl =
                            'https://identitytoolkit.googleapis.com/v1/accounts:update?key=$API_KEY';

                        var idToken = await user.getIdToken(
                            true); // where user is FirebaseUser user

                        final Map<String, dynamic> payload = {
                          'idToken': idToken,
                          'password': newPasswordController.text,
                          'returnSecureToken': true
                        };

                        http.Response response = await http.post(
                          Uri.parse(changePasswordUrl),
                          body: json.encode(payload),
                          headers: {'Content-Type': 'application/json'},
                        );
                        print(response.body);
                        if (response.statusCode == 200) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('password', "");
                          await FirebaseAuth.instance.signOut();
                          Get.to(LoginPage(), binding: AuthBindings());
                        } else {
                          ChangePasswordError changeError =
                              ChangePasswordError.fromJson(
                                  jsonDecode(response.body));
                          if (response.body
                              .contains("CREDENTIAL_TOO_OLD_LOGIN_AGAIN")) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  backgroundColor: Colors.black87,
                                  elevation: 0,
                                  child: IntrinsicWidth(
                                    child: IntrinsicHeight(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 0, 0),
                                            child: Text(
                                                'Please login again to change password. ',
                                                style: GoogleFonts.zillaSlab(
                                                  textStyle: TextStyle(
                                                      fontSize: 20 *
                                                          MediaQuery
                                                              .textScaleFactorOf(
                                                                  context),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.090,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 30),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await FirebaseAuth.instance
                                                        .signOut();
                                                    Get.to(LoginPage(),
                                                        binding:
                                                            AuthBindings());
                                                  },
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.060,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: new AssetImage(
                                                            "assets/images/_Common/UIElements/Button.png",
                                                          ),
                                                          fit: BoxFit.fill),
                                                      //color: Colors.red
                                                    ),
                                                    child: Center(
                                                      child: Text('LOGIN AGAIN',
                                                          style: GoogleFonts
                                                              .zillaSlab(
                                                            textStyle: TextStyle(
                                                                fontSize: 18 *
                                                                    MediaQuery
                                                                        .textScaleFactorOf(
                                                                            context),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.030,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 10),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.060,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image:
                                                                new AssetImage(
                                                              "assets/images/_Common/UIElements/Button.png",
                                                            ),
                                                            fit: BoxFit.fill),
                                                        //color: Colors.red
                                                      ),
                                                      child: Center(
                                                        child: Text('CANCEL',
                                                            style: GoogleFonts
                                                                .zillaSlab(
                                                              textStyle: TextStyle(
                                                                  fontSize: 18 *
                                                                      MediaQuery
                                                                          .textScaleFactorOf(
                                                                              context),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Container(
                                      child: Text(changeError.error.message),
                                    ),
                                  );
                                });
                          }
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Passwords Don't Match",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.080,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage(
                              "assets/images/_Common/UIElements/Button.png",
                            ),
                            fit: BoxFit.fill),
                        //color: Colors.red
                      ),
                      child: Center(
                        child: Text('Change Password',
                            style: GoogleFonts.zillaSlab(
                              textStyle: TextStyle(
                                  fontSize: 20 *
                                      MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          width: MediaQuery.of(context).size.width * 0.37,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage(
                                  "assets/images/_Common/UIElements/Button.png",
                                ),
                                fit: BoxFit.fill),
                            //color: Colors.red
                          ),
                          child: Center(
                            child: Text('Cancel',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 20 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ])),
      ),
    ));
  }
}

class ChangePasswordError {
  Error error;

  ChangePasswordError({this.error});

  ChangePasswordError.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    return data;
  }
}

class Error {
  int code;
  String message;
  List<Errors> errors;

  Error({this.code, this.message, this.errors});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = new List<Errors>();
      json['errors'].forEach((v) {
        errors.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String message;
  String domain;
  String reason;

  Errors({this.message, this.domain, this.reason});

  Errors.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    domain = json['domain'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['domain'] = this.domain;
    data['reason'] = this.reason;
    return data;
  }
}
