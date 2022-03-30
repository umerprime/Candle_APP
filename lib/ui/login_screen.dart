
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:candle/ui/home_screen.dart';
import 'package:candle/ui/new_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:candle/bindings.dart';
import 'package:get/get.dart';
import 'package:candle/viewmodels/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;
  final notifier = Get.find<AuthViewModel>();

  @override
  void initState() {
    rememberMeView();
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
                      //CONTAINER FOR VIRTUAL MEMORY TEXT
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.020,),
                      Container(
                        //color: Colors.blue,
                        height: MediaQuery.of(context).size.height*0.050,
                        child: Text('VIRTUAL',
                            style: GoogleFonts.zillaSlab(
                              textStyle: TextStyle(
                                fontSize: 32 *
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
                                  fontSize: 32 *
                                      MediaQuery.textScaleFactorOf(
                                          context),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[50]
                              ),

                            )),
                      ),





                      //conatiner for fire
                      Stack(
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 0,0,0),
                            child: Image(image: new AssetImage( "assets/fires.gif",
                            ),height: 100,width: 100,),
                          ),


                          //CONTAINER FOR GLOBE
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,80,0,0),
                            child: Image(image: new AssetImage( "assets/images/_Common/Candle/Globe/Earth_00084.png",

                            ),height: 150,width: 300,),
                          ),



                        ],
                      ),









                      //user name and password
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
                              controller: nameController,
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
                              controller: passwordController,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  height: 1.5,
                                  color: Colors.white
                              ),
                              obscureText: _isHidden,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),
                                //icon: new Icon(Icons.lock,size: 18.0,),

                                // suffix: InkWell(
                                //   onTap: _togglePasswordView,
                                //   child: Icon(
                                //     _isHidden
                                //         ? Icons.visibility
                                //         : Icons.visibility_off,
                                //     size:15.0,),
                                // ),

                              ),
                            ),
                          ),
                        ),
                      ),






                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.020,),






              //check uncheck button
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0,0,0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 3.0, color: Colors.blueGrey),
                          left: BorderSide(width: 3.0, color: Colors.blueGrey),
                          right: BorderSide(width: 3.0, color: Colors.blueGrey),
                          bottom: BorderSide(width: 3.0, color:Colors.blueGrey),
                        ),
                      ),

                      child: Checkbox(
                        activeColor:Colors.blueGrey[600],
                        checkColor: Colors.white,
                        value: notifier.rememberMe,
                        onChanged: (bool value) async{
                          setState(() {
                            notifier.rememberMe=value;
                          });
                        },
                      ),
                    ),
                  ),

                  // Container(
                  //   //     height: MediaQuery
                  //   //         .of(context)
                  //   //         .size
                  //   //         .height * 0.05,
                  //   //     width: MediaQuery.of(context).size.width*0.32,
                  //   //     decoration: BoxDecoration(
                  //   //       image: DecorationImage(
                  //   //           image: new AssetImage( "assets/images/_Common/UIElements/check_box_01.png",),
                  //   //           fit: BoxFit.fitHeight
                  //   //       ),
                  //   //       //color: Colors.red
                  //   //     ),)
                  //   //
                  //   // ),


                  //   child:
                  //
                  //   _check ?
                  //
                  //   Container(
                  //     height: MediaQuery
                  //         .of(context)
                  //         .size
                  //         .height * 0.05,
                  //     width: MediaQuery.of(context).size.width*0.32,
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: new AssetImage( "assets/images/_Common/UIElements/check_box_02.png",),
                  //           fit: BoxFit.fitHeight
                  //       ),
                  //       //color: Colors.red
                  //     ),)
                  //
                  //       :
                  //
                  //   Container(
                  //     height: MediaQuery
                  //         .of(context)
                  //         .size
                  //         .height * 0.05,
                  //     width: MediaQuery.of(context).size.width*0.32,
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: new AssetImage( "assets/images/_Common/UIElements/check_box_01.png",),
                  //           fit: BoxFit.fitHeight
                  //       ),
                  //       //color: Colors.red
                  //     ),)
                  //
                  // ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,0,0,0),
                    child: Text('Remember Password',
                        style: GoogleFonts.zillaSlab(
                          textStyle: TextStyle(
                              fontSize: 15 *
                                  MediaQuery.textScaleFactorOf(
                                      context),
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),

                        )),
                  ),


                ],
              ),








                      //row for button at bottom
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.040,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          InkWell(
                            onTap: (){

                              Get.to(NewUserPage(), binding: AuthBindings());
                            },
                            child: Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.065,
                              width: MediaQuery.of(context).size.width*0.37,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: new AssetImage( "assets/images/_Common/UIElements/Button.png",),
                                      fit: BoxFit.fill
                                  ),
                                  //color: Colors.red
                              ),


                                child: Center(
                                  child: Text('NEW USER',
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
                              notifier.email=nameController.text;
                              notifier.password=passwordController.text;
                              notifier.context=context;
                              notifier.validateLoginInput();


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
                                child: Text('SIGN IN',
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
  void rememberMeView()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email');
    String password = prefs.getString('password');
    if(password.isNotEmpty&&email.isNotEmpty){
      nameController.text=email;
      passwordController.text=password;
      notifier.rememberMe=true;
    }
    setState(() {

    });
  }
}