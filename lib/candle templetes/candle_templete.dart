

import 'package:candle/welcome%20user/welcome_cathelic_memory_candle.dart';
import 'package:candle/welcome%20user/welcome_virtual_memory_candle_.dart';
import 'package:candle/welcome%20user/welcome_jewish_yahrzeit.dart';
import 'package:candle/ui/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:candle/bindings.dart';
import 'package:candle/viewmodels/auth_view_model.dart';


class Templete_Page extends StatefulWidget {
  @override
  _TempletePageState createState() => _TempletePageState();
}

class _TempletePageState extends State<Templete_Page> {

  bool _isHidden = true;
  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
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
                      child: Text('CHOOSE YOUR',
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
                      child: Text('CANDLE TEMPLETE',
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





                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.050,),

                    InkWell(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => welcomeJewishYarhzeit()),
                        );
                      },
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.18,
                        width: MediaQuery.of(context).size.width*0.90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage( "assets/images/CandleTypes/button_Jewish.png",),
                              fit: BoxFit.fill
                          ),
                          //color: Colors.red
                        ),


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image: new AssetImage( "assets/images/CandleTypes/Jewish_Star.png",
                            ),height: 98,width: 100,),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,25,0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text('JEWISH',
                                        style: GoogleFonts.zillaSlab(
                                          textStyle: TextStyle(
                                              fontSize: 32*
                                                  MediaQuery.textScaleFactorOf(
                                                      context),
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),

                                        )),
                                  ),
                                  Center(
                                    child: Text('YAHRZEIT',
                                        style: GoogleFonts.zillaSlab(
                                          textStyle: TextStyle(
                                              fontSize: 32*
                                                  MediaQuery.textScaleFactorOf(
                                                      context),
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),

                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),






                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.050,),

                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomeCathelicMemoryCandle()),
                        );
                      },
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.18,
                        width: MediaQuery.of(context).size.width*0.90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage( "assets/images/CandleTypes/button_Catholic.png",),
                              fit: BoxFit.fill
                          ),
                          //color: Colors.red
                        ),


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(9,0,0,0),
                              child: Image(image: new AssetImage( "assets/images/CandleTypes/Catholic_Cross.png",
                              ),height: 98,width: 100,),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,25,0),
                              child: Center(
                                child: Text('CATHOLIC',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 32 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),

                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),





                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.050,),

                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomeVirtualMemoryCandle()),
                        );
                      },
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.18,
                        width: MediaQuery.of(context).size.width*0.90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage( "assets/images/CandleTypes/button_Generic.png",),
                              fit: BoxFit.fill
                          ),
                          //color: Colors.red
                        ),


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                              child: Image(image: new AssetImage( "assets/images/CandleTypes/Generic_Candle.png",
                              ),height:98,width: 100,),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,40,0),
                              child: Center(
                                child: Text('GENERAL',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 32 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),

                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.050,),
                    InkWell(
                      onTap: (){

                        Get.to(HomePage(), binding: CandleBindings());
                      },
                      child: Image(image: new AssetImage( "assets/images/_Common/Icons/home.png",
                      ),height: 45,width: 45,),
                    ),


                  ]
              )
          ),
        ));
  }
 }