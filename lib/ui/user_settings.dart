import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:candle/bindings.dart';
import 'package:candle/ui/change_password.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class UserSettings extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<UserSettings> {
  TextEditingController nameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final notifier = Get.find<CandleViewModel>();

  @override
  void initState() {
    getUserInfo();
  }

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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 1,
                    //color: Colors.green,

                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.30,
                            width: MediaQuery.of(context).size.width * 0.25,
                            //color: Colors.red,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Image(
                                  image: new AssetImage(
                                "assets/images/_Common/Candle/Candle_00000.png",
                              )),
                            ),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  //color: Colors.blue,
                                  height: MediaQuery.of(context).size.height *
                                      0.050,
                                  child: Text('VIRTUAL',
                                      style: GoogleFonts.zillaSlab(
                                        textStyle: TextStyle(
                                          fontSize: 25 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[50],
                                        ),
                                      )),
                                ),
                                Container(
                                  //color: Colors.green,
                                  height: MediaQuery.of(context).size.height *
                                      0.050,
                                  child: Text('MEMORY CANDLES',
                                      style: GoogleFonts.zillaSlab(
                                        textStyle: TextStyle(
                                            fontSize: 25 *
                                                MediaQuery.textScaleFactorOf(
                                                    context),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[50]),
                                      )),
                                ),
                              ])
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  Container(
                    //color: Colors.green,
                    height: MediaQuery.of(context).size.height * 0.050,
                    child: Text('USER SETTINGS',
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
                    child: IgnorePointer(
                      ignoring: true,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: AutoSizeTextField(
                          controller: emailController,
                          fullwidth: true,
                          minFontSize: 16.0,
                          style: TextStyle(
                              fontSize: 18.0, height: 1.5, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
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
                          controller: firstnameController,
                          textCapitalization: TextCapitalization.words,
                          fullwidth: true,
                          minFontSize: 16.0,
                          style: TextStyle(
                              fontSize: 18.0, height: 1.5, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'First Name',
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
                          controller: lastnameController,
                          textCapitalization: TextCapitalization.words,
                          fullwidth: true,
                          minFontSize: 16.0,
                          style: TextStyle(
                              fontSize: 18.0, height: 1.5, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Last Name',
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
                          controller: phoneController,
                          fullwidth: true,
                          keyboardType: TextInputType.datetime,
                          minFontSize: 16.0,
                          style: TextStyle(
                              fontSize: 18.0, height: 1.5, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(HomePage(), binding: CandleBindings());
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
                      InkWell(
                        onTap: () async {
                          var user = await FirebaseAuth.instance.currentUser;
                          await user.updateProfile(
                              displayName: firstnameController.text +
                                  " " +
                                  lastnameController.text,
                              photoURL: phoneController.text);

                          Get.to(HomePage(), binding: CandleBindings());
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          width: MediaQuery.of(context).size.width * 0.30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage(
                                  "assets/images/_Common/UIElements/Button.png",
                                ),
                                fit: BoxFit.fill),
                            //color: Colors.red
                          ),
                          child: Center(
                            child: Text('Save',
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  InkWell(
                    onTap: () {
                      _showDeleteDialog();
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
                        child: Text('Delete Account',
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()));
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
                  !notifier.upgradedAccount
                      ? InkWell(
                          onTap: () {},
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
                            child: !notifier.upgradedAccount
                                ? GestureDetector(
                                    onTap: () {
                                      notifier.makePayment();
                                      //   notifier.showDialogue(context);}
                                    },
                                    child: Center(
                                      child: Text('Upgrade test 6',
                                          style: GoogleFonts.zillaSlab(
                                            textStyle: TextStyle(
                                                fontSize: 20 *
                                                    MediaQuery
                                                        .textScaleFactorOf(
                                                            context),
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                    ),
                                  )
                                : Container(),
                          ),
                        )
                      : Container(),
                ])),
      ),
    ));
  }

  void getUserInfo() async {
    var value = await FirebaseAuth.instance.currentUser;
    setState(() {
      emailController.text = value.email;
      phoneController.text = value.photoURL;
      var str = value.displayName;
      var parts = str.split(' ');
      var prefix = parts[0].trim(); // prefix: "date"
      var sufix = parts.sublist(1).join(' ').trim(); // date: "'2019:04:01'"
      firstnameController.text = prefix;
      lastnameController.text = sufix;
    });
  }

  void _showDeleteDialog() {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child:
                        Text('Are you sure you want to delete current account?',
                            style: GoogleFonts.zillaSlab(
                              textStyle: TextStyle(
                                  fontSize: 20 *
                                      MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.090,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            notifier.deleteAccount();
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.060,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: new AssetImage(
                                    "assets/images/_Common/UIElements/Button.png",
                                  ),
                                  fit: BoxFit.fill),
                              //color: Colors.red
                            ),
                            child: Center(
                              child: Text('YES',
                                  style: GoogleFonts.zillaSlab(
                                    textStyle: TextStyle(
                                        fontSize: 18 *
                                            MediaQuery.textScaleFactorOf(
                                                context),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.030,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.060,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: new AssetImage(
                                      "assets/images/_Common/UIElements/Button.png",
                                    ),
                                    fit: BoxFit.fill),
                                //color: Colors.red
                              ),
                              child: Center(
                                child: Text('NO',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 18 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
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
  }
}
