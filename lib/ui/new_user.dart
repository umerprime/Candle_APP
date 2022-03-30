
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:candle/viewmodels/auth_view_model.dart';
import 'package:candle/ui/home_screen.dart';

import 'login_screen.dart';
import 'package:get/get.dart';
import 'package:candle/bindings.dart';

class NewUserPage extends StatefulWidget {
  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  final notifier = Get.find<AuthViewModel>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  bool _isHidden = true;
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 1,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 1,

                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/_Common/BGs/Bg.jpg"),
                      fit: BoxFit.fill,
                    )
                ),


                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.15,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 1,
                        //color: Colors.green,

                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[

                          Container(
                            height: MediaQuery.of(context).size.height*0.30,
                            width:  MediaQuery.of(context).size.width*0.25,
                            //color: Colors.red,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child:
                              Image(image: new AssetImage( "assets/images/_Common/Candle/Candle_00000.png",

                              )),),
                          ),

                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                Container(
                                  //color: Colors.blue,
                                  height: MediaQuery.of(context).size.height*0.050,
                                  child: Text('VIRTUAL',
                                      style: GoogleFonts.zillaSlab(
                                        textStyle: TextStyle(
                                          fontSize: 25 *
                                              MediaQuery.textScaleFactorOf(context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[50],),)),
                                ),

                                Container(
                                  //color: Colors.green,
                                  height: MediaQuery.of(context).size.height*0.050,
                                  child: Text('MEMORY CANDLES',
                                      style: GoogleFonts.zillaSlab(
                                        textStyle: TextStyle(
                                            fontSize: 25 *
                                                MediaQuery.textScaleFactorOf(
                                                    context),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[50]
                                        ),

                                      )),
                                ),

                              ])


                        ]),
                      ),


                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.020,),

                      Text('NEW USER SIGN-UP HERE',
                          style: GoogleFonts.zillaSlab(
                            textStyle: TextStyle(
                              fontSize: 20 *
                                  MediaQuery.textScaleFactorOf(context),
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[50],),)),

                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025,),

                      Container(
                        height: MediaQuery.of(context).size.height*0.075,
                        width: MediaQuery.of(context).size.width*0.80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
                              fit: BoxFit.fill
                          ),
                          //color: Colors.red
                        ),


                        child: InkWell(
                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,0, 0, 0),
                            child: AutoSizeTextField(
                              controller: emailController,
                              fullwidth: true,
                              minFontSize: 16.0,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  height: 1.5,
                                  color: Colors.white                              ),
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





                      // SizedBox(height: MediaQuery
                      //     .of(context)
                      //     .size
                      //     .height * 0.025,),

                      //user name,password,repeat password, firstname, lastname,email,mobileno
                      // Container(
                      //   height: MediaQuery.of(context).size.height*0.075,
                      //   width: MediaQuery.of(context).size.width*0.80,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //         image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
                      //         fit: BoxFit.fill
                      //     ),
                      //     //color: Colors.red
                      //   ),
                      //
                      //
                      //   child: InkWell(
                      //     onTap: (){
                      //
                      //     },
                      //     child: Padding(
                      //       padding: const EdgeInsets.fromLTRB(10,0, 0, 0),
                      //       child: AutoSizeTextField(
                      //         controller: nameController,
                      //         fullwidth: true,
                      //         minFontSize: 16.0,
                      //         style: TextStyle(
                      //             fontSize: 18.0,
                      //             height: 1.5,
                      //             color: Colors.white
                      //         ),
                      //         decoration: InputDecoration(
                      //           border: InputBorder.none,
                      //           hintText: 'User Name',
                      //           hintStyle: GoogleFonts.poppins(
                      //             fontSize: 16.0,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.grey[500],
                      //           ),
                      //           //icon: new Icon(Icons.lock,size: 18.0,),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //
                      //


                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.020,),

                      Container(
                        height: MediaQuery.of(context).size.height*0.075,
                        width: MediaQuery.of(context).size.width*0.80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
                              fit: BoxFit.fill
                          ),
                          //color: Colors.red
                        ),


                        child: InkWell(
                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,0, 0, 0),
                            child: AutoSizeTextField(
                              controller: passwordController,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  height: 1.5,
                                  color: Colors.white                              ),
                              obscureText: _isHidden,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),


                              ),
                            ),
                          ),
                        ),
                      ),




                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025,),


                      Container(
                        height: MediaQuery.of(context).size.height*0.075,
                        width: MediaQuery.of(context).size.width*0.80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
                              fit: BoxFit.fill
                          ),
                          //color: Colors.red
                        ),


                        child: InkWell(
                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,0, 0, 0),
                            child: AutoSizeTextField(
                              controller: repeatpasswordController,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  height: 1.5,
                                  color: Colors.white                              ),
                              obscureText: _isHidden,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Repeat Password',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),


                              ),
                            ),
                          ),
                        ),
                      ),



                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025,),


                      Container(
                        height: MediaQuery.of(context).size.height*0.075,
                        width: MediaQuery.of(context).size.width*0.80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
                              fit: BoxFit.fill
                          ),
                          //color: Colors.red
                        ),


                        child: InkWell(
                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,0, 0, 0),
                            child: AutoSizeTextField(
                              controller: firstnameController,
                              textCapitalization: TextCapitalization.sentences,
                              fullwidth: true,
                              minFontSize: 16.0,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  height: 1.5,
                                  color: Colors.white
                              ),
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





                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025,),


                      Container(
                        height: MediaQuery.of(context).size.height*0.075,
                        width: MediaQuery.of(context).size.width*0.80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
                              fit: BoxFit.fill
                          ),
                          //color: Colors.red
                        ),


                        child: InkWell(
                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,0, 0, 0),
                            child: AutoSizeTextField(
                              controller: lastnameController,
                              textCapitalization: TextCapitalization.sentences,
                              fullwidth: true,
                              minFontSize: 16.0,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  height: 1.5,
                                  color: Colors.white                              ),
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



                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025,),



                      Container(
                        height: MediaQuery.of(context).size.height*0.075,
                        width: MediaQuery.of(context).size.width*0.80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
                              fit: BoxFit.fill
                          ),
                          //color: Colors.red
                        ),


                        child: InkWell(
                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,0, 0, 0),
                            child: AutoSizeTextField(
                              controller: mobilenoController,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  height: 1.5,
                                  color: Colors.white                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Mobile (10 digits-no dashes)',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],

                                ),


                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,

                              ], // Only numbers can be entered
                            ),
                          ),
                        ),
                      ),



                      //row for button at bottom
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          InkWell(
                            onTap: (){
                              Get.to(LoginPage(), binding: AuthBindings());

                            },
                            child: Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.065,
                              width: MediaQuery.of(context).size.width*0.32,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: new AssetImage( "assets/images/_Common/UIElements/Button.png",),
                                    fit: BoxFit.fill
                                ),
                                //color: Colors.red
                              ),


                              child: Center(
                                child: Text('Cancel',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 20 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),

                                    )),
                              ),
                            ),
                          ),


                          InkWell(
                            onTap: (){
                              if(passwordController.text==repeatpasswordController.text){
                                notifier.context=context;
                                notifier.email=emailController.text;
                                notifier.password=passwordController.text;
                                notifier.displayName=firstnameController.text+" "+lastnameController.text;
                                notifier.phone=mobilenoController.text;
                                notifier.validateRegisterInput();
                              }else{
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          child: Text("Passwords Don't Match"),
                                        ),
                                      );
                                    });
                              }


                            },
                            child: Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.065,
                              width: MediaQuery.of(context).size.width*0.30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: new AssetImage( "assets/images/_Common/UIElements/Button.png",),
                                    fit: BoxFit.fill
                                ),
                                //color: Colors.red
                              ),


                              child: Center(
                                child: Text('Submit',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 20 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),

                                    )),
                              ),
                            ),
                          ),









                        ],)


                    ]
                )
            ),
          ),
        ));
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}