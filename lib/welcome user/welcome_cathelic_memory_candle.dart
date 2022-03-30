import 'package:candle/candle%20templetes/candle_templete.dart';
import 'package:candle/free%20and%20paid%20version/freeandpaidversion_cathelic.dart';
import 'package:candle/ui/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:candle/bindings.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:candle/free%20version%20screen/free_versionCathelic.dart';


class WelcomeCathelicMemoryCandle extends StatefulWidget {
  @override
  _welcomeCathelicPageState createState() => _welcomeCathelicPageState();
}

class _welcomeCathelicPageState extends State<WelcomeCathelicMemoryCandle> {
  final notifier = Get.find<CandleViewModel>();

  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:Container(
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

          child:Column(
            children: [

              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.17,
                width: MediaQuery.of(context).size.width*1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage( "assets/images/CandleTypes/Top_band_Catholic.png",),
                      fit: BoxFit.fill
                  ),
                  //color: Colors.red
                ),


                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: new AssetImage( "assets/images/CandleTypes/Catholic_Cross.png",
                    ),height: 100,width: 100,),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,25,0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text('WELCOME TO YOUR',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18*
                                          MediaQuery.textScaleFactorOf(
                                              context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),

                                )),
                          ),
                          Center(
                            child: Text('CATHOLIC MEMORY',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18*
                                          MediaQuery.textScaleFactorOf(
                                              context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),

                                )),
                          ),

                          Center(
                            child: Text('CANDLE',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18*
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

              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.050,),

              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.60,
                width: MediaQuery.of(context).size.width*0.90,


                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                  Text('Candles are lit to symbolize our prayers, vows of prayer, or simply honoring God or one of His Saints.',
                      style: GoogleFonts.zillaSlab(
                        textStyle: TextStyle(
                            fontSize: 14*
                                MediaQuery.textScaleFactorOf(
                                    context),
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),

                      )),



                  Text('We light a candle while praying for our intention or offering our thanks and then leave the flame burning as signs of our prayers.',
                      style: GoogleFonts.zillaSlab(
                        textStyle: TextStyle(
                            fontSize: 14*
                                MediaQuery.textScaleFactorOf(
                                    context),
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),

                      )),



                  Text('To light a candle for someone" indicates ones intention to say a prayer for another person, and the candle symbolizes that prayer.',
                      style: GoogleFonts.zillaSlab(
                        textStyle: TextStyle(
                            fontSize: 14*
                                MediaQuery.textScaleFactorOf(
                                    context),
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),

                      )),





                  Text('Your Catholic Memory Candle offers an alternative method of remembering your loved ones. We send you reminders on the anniversary of the death of your loved ones along with a link to your candle. Once activated, your candle will burn on your app for 24-hours.',
                      style: GoogleFonts.zillaSlab(
                        textStyle: TextStyle(
                            fontSize: 14*
                                MediaQuery.textScaleFactorOf(
                                    context),
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),

                      )),





                  Text('Share the memories with your friends and families all over the world.',
                      style: GoogleFonts.zillaSlab(
                        textStyle: TextStyle(
                            fontSize: 14*
                                MediaQuery.textScaleFactorOf(
                                    context),
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),

                      )),






                ],),


              ),


              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.050,),


              //BottomNavbar(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Templete_Page()),
                      );
                    },
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Image(image: new AssetImage( "assets/images/_Common/Icons/Fornt_button.png",
                      ),height: 45,width: 45,),
                    ),
                  ),



                  InkWell(
                    onTap: (){
                      Get.to(HomePage(), binding: CandleBindings());
                    },
                    child: Image(image: new AssetImage( "assets/images/_Common/Icons/home.png",
                    ),height: 45,width: 45,),
                  ),



                  InkWell(
                    onTap: (){
                      if(notifier.upgradedAccount) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FreeVersionCatholic(null)),
                        );

                      }else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              FreeAndPaidVersionCathelic()),
                        );
                      }
                    },
                    child: Image(image: new AssetImage( "assets/images/_Common/Icons/Fornt_button.png",
                    ),height: 45,width: 45,),
                  ),




                ],
              ),




            ],) ,

        ),
      ),
    );


  }
}