import 'package:candle/bindings.dart';
import 'package:candle/free%20and%20paid%20version/widgets/free_version_button.dart';
import 'package:candle/free%20and%20paid%20version/widgets/freeversiontext.dart';
import 'package:candle/free%20and%20paid%20version/widgets/paidversiontext.dart';
import 'package:candle/free%20version%20screen/free_versionJews.dart';
import 'package:candle/ui/home_screen.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:candle/welcome%20user/welcome_jewish_yahrzeit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FreeAndPaidVersionJews extends StatefulWidget {
  String type;
  FreeAndPaidVersionJews(this.type);
  @override
  _welcomeUserJewishPageState createState() => _welcomeUserJewishPageState();
}

class _welcomeUserJewishPageState extends State<FreeAndPaidVersionJews> {
  String displayName = "";
  final notifier = Get.find<CandleViewModel>();

  @override
  void initState() {
    displayName_two().then((value) => {});
  }

  Future displayName_two() async {
    var value = await FirebaseAuth.instance.currentUser;
    print(value.displayName + "usssss");
    displayName = value.displayName;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage("assets/images/_Common/BGs/Bg.jpg"),
            fit: BoxFit.fill,
          )),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage(
                        "assets/images/CandleTypes/Top_band_Jewish.png",
                      ),
                      fit: BoxFit.fill),
                  //color: Colors.red
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: new AssetImage(
                        "assets/images/CandleTypes/Jewish_Star.png",
                      ),
                      height: 90,
                      width: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text('WELCOME',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ),
                          Center(
                            child: Text(displayName,
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 16 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ),

                          //       Center(
                          // child: Text('You Are Almost There',
                          //     style: GoogleFonts.zillaSlab(
                          //      textStyle: TextStyle(
                          //             fontSize: 14*
                          //           MediaQuery.textScaleFactorOf(
                          //                      context),
                          //                fontWeight: FontWeight.bold,
                          //                    color: Colors.white
                          //                       ),
                          //
                          //                           ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.030,
              ),
              SingleChildScrollView(
                  child: Column(children: [
                InkWell(
                  onTap: () {
                    Get.to(FreeVersionJews(null), binding: CandleBindings());
                  },
                  child: VersionButton(
                    title: 'FREE VERSION',
                  ),

                  // Container(
                  //   height: MediaQuery
                  //       .of(context)
                  //       .size
                  //       .height * 0.09,
                  //   width: MediaQuery.of(context).size.width*1,
                  //     color: Colors.blueGrey[500],
                  //
                  //
                  //
                  //   child:
                  //
                  //   Stack(
                  //       children:[
                  //   Center(
                  //     child: Container(
                  //     height: MediaQuery
                  //         .of(context)
                  //         .size
                  //         .height * 0.09,
                  //       width: MediaQuery.of(context).size.width*0.80,
                  //
                  //     child:
                  //     Image(image: new AssetImage( "assets/images/_Common/UIElements/Green_button.png",),height: 100,width: 100,),
                  //              ),
                  //   ),
                  //
                  //     Center(
                  //     child: Text('FREE VERSION',
                  //         style: GoogleFonts.zillaSlab(
                  //           textStyle: TextStyle(
                  //               fontSize: 20*
                  //                   MediaQuery.textScaleFactorOf(
                  //                       context),
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.black
                  //           ),
                  //
                  //         )),
                  //   ),
                  //
                  //
                  // ]),
                  // ),
                ),

                FreeVersionText(),

                //
                // Container(
                //   height: MediaQuery
                //       .of(context)
                //       .size
                //       .height * 0.18,
                //   width: MediaQuery.of(context).size.width*1,
                //   color: Colors.blueGrey[600],
                //   // decoration: BoxDecoration(
                //   //   image: DecorationImage(
                //   //       image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
                //   //       fit: BoxFit.fitHeight
                //   //   ),
                //   // ),
                //
                //
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(10,0,0,0),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Center(
                //           child: Text('● Get notifications reminding you when to light your Memory Candle.',
                //               style: GoogleFonts.zillaSlab(
                //                 textStyle: TextStyle(
                //                     fontSize: 16*
                //                         MediaQuery.textScaleFactorOf(
                //                             context),
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.white
                //                 ),
                //
                //               )),
                //         ),
                //
                //         Center(
                //           child: Text('● Receive a Memory Candle on your device that burns for 24-hours.',
                //               style: GoogleFonts.zillaSlab(
                //                 textStyle: TextStyle(
                //                     fontSize: 16*
                //                         MediaQuery.textScaleFactorOf(
                //                             context),
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.white
                //                 ),
                //
                //               )),
                //
                //         ),
                //
                //       ],
                //     ),
                //   ),
                // ),
                //
                //

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),

                InkWell(
                    onTap: () {
                      notifier.makePayment();
                    },
                    child: VersionButton(
                      title: 'PAID VERSION (one-time fee',
                    )

                    // Container(
                    //   height: MediaQuery
                    //       .of(context)
                    //       .size
                    //       .height * 0.09,
                    //   width: MediaQuery.of(context).size.width*1,
                    //   color: Colors.blueGrey[500],
                    //
                    //
                    //
                    //   child: Stack(children:[
                    //
                    //     Center(
                    //       child: Container(
                    //         height: MediaQuery
                    //             .of(context)
                    //             .size
                    //             .height * 0.09,
                    //         width: MediaQuery.of(context).size.width*0.80,
                    //
                    //         child:
                    //         Image(image: new AssetImage( "assets/images/_Common/UIElements/Green_button.png",),height: 100,width: 100,),
                    //       ),
                    //     ),
                    //
                    //     Center(
                    //       child: Text('PAID VERSION (one-time fee)',
                    //           style: GoogleFonts.zillaSlab(
                    //             textStyle: TextStyle(
                    //                 fontSize: 20*
                    //                     MediaQuery.textScaleFactorOf(
                    //                         context),
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Colors.black
                    //             ),
                    //
                    //           )),
                    //     ),
                    //
                    //
                    //   ]),
                    // ),
                    ),

                PaidVersionText(),

                // Container(
                //   height: MediaQuery
                //       .of(context)
                //       .size
                //       .height * 0.44,
                //   width: MediaQuery.of(context).size.width*1,
                //   color: Colors.blueGrey[600],
                //   // decoration: BoxDecoration(
                //   //   image: DecorationImage(
                //   //       image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
                //   //       fit: BoxFit.fitHeight
                //   //   ),
                //   // ),
                //
                //
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(10,0,0,0),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Center(
                //           child: Text('● Get notifications reminding you when to light your Memory Candle.',
                //               style: GoogleFonts.zillaSlab(
                //                 textStyle: TextStyle(
                //                     fontSize: 16*
                //                         MediaQuery.textScaleFactorOf(
                //                             context),
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.white
                //                 ),
                //
                //               )),
                //         ),
                //
                //         Center(
                //           child: Text('● Receive a Memory Candle on your device that burns for 24-hours.',
                //               style: GoogleFonts.zillaSlab(
                //                 textStyle: TextStyle(
                //                     fontSize: 16*
                //                         MediaQuery.textScaleFactorOf(
                //                             context),
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.white
                //                 ),
                //
                //               )),
                //
                //         ),
                //
                //
                //   Center(
                //     child: Text('● Send out invitations to friends and relatives so they can share in the event.',
                //         style: GoogleFonts.zillaSlab(
                //           textStyle: TextStyle(
                //               fontSize: 16*
                //                   MediaQuery.textScaleFactorOf(
                //                       context),
                //               fontWeight: FontWeight.bold,
                //               color: Colors.white
                //           ),
                //
                //         )),),
                //
                //
                //
                //   Center(
                //     child: Text('● Upload a photo of your loved ones to appear on your Memory Candle.',
                //         style: GoogleFonts.zillaSlab(
                //           textStyle: TextStyle(
                //               fontSize: 16*
                //                   MediaQuery.textScaleFactorOf(
                //                       context),
                //               fontWeight: FontWeight.bold,
                //               color: Colors.white
                //           ),
                //
                //         )),),
                //
                //
                //     Align(
                //       alignment: Alignment.centerLeft,
                //       child: Text('● Select music to accompany your Memory Candle. ',
                //       style: GoogleFonts.zillaSlab(
                //         textStyle: TextStyle(
                //             fontSize: 16*
                //                 MediaQuery.textScaleFactorOf(
                //                     context),
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white
                //         ),
                //
                //       )),
                //     ),
                //
                //
                //
                //
                //         Center(
                //           child: Text('● Text live with  friends and family during the event.  ',
                //               style: GoogleFonts.zillaSlab(
                //                 textStyle: TextStyle(
                //                     fontSize: 16*
                //                         MediaQuery.textScaleFactorOf(
                //                             context),
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.white
                //                 ),
                //
                //               )),)
                //
                //
                //
                //
                //       ],
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => welcomeJewishYarhzeit()),
                          );
                        },
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Image(
                            image: new AssetImage(
                              "assets/images/_Common/Icons/Fornt_button.png",
                            ),
                            height: 45,
                            width: 45,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Get.to(HomePage(), binding: CandleBindings());
                        },
                        child: Image(
                          image: new AssetImage(
                            "assets/images/_Common/Icons/home.png",
                          ),
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ),
                  ],
                ),
              ])),
            ],
          ),
        ),
      ),
    ));
  }
}
