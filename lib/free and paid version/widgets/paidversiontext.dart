
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaidVersionText extends StatefulWidget {

  @override
  _welcomeUserCathelicPageState createState() => _welcomeUserCathelicPageState();
}

class _welcomeUserCathelicPageState extends State<PaidVersionText> {
  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {
    return

      Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.45,
        width: MediaQuery.of(context).size.width*1,
        color: Colors.blueGrey[600],
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: new AssetImage( "assets/images/_Common/UIElements/Band.png",),
        //       fit: BoxFit.fitHeight
        //   ),
        // ),


        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,0,0,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text('● Get notifications reminding you when to light your Memory Candle.',
                    style: GoogleFonts.zillaSlab(
                      textStyle: TextStyle(
                          fontSize: 16*
                              MediaQuery.textScaleFactorOf(
                                  context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),

                    )),
              ),

              Center(
                child: Text('● Receive a Memory Candle on your device that burns for 24-hours.',
                    style: GoogleFonts.zillaSlab(
                      textStyle: TextStyle(
                          fontSize: 16*
                              MediaQuery.textScaleFactorOf(
                                  context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),

                    )),

              ),


              Center(
                child: Text('● Send out invitations to friends and relatives so they can share in the event.',
                    style: GoogleFonts.zillaSlab(
                      textStyle: TextStyle(
                          fontSize: 16*
                              MediaQuery.textScaleFactorOf(
                                  context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),

                    )),),



              Center(
                child: Text('● Upload a photo of your loved ones to appear on your Memory Candle.',
                    style: GoogleFonts.zillaSlab(
                      textStyle: TextStyle(
                          fontSize: 16*
                              MediaQuery.textScaleFactorOf(
                                  context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),

                    )),),


              Align(
                alignment: Alignment.centerLeft,
                child: Text('● Select music to accompany your Memory Candle. ',
                    style: GoogleFonts.zillaSlab(
                      textStyle: TextStyle(
                          fontSize: 16*
                              MediaQuery.textScaleFactorOf(
                                  context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),

                    )),
              ),




              Center(
                child: Text('● Text live with  friends and family during the event. ',
                    style: GoogleFonts.zillaSlab(
                      textStyle: TextStyle(
                          fontSize: 16*
                              MediaQuery.textScaleFactorOf(
                                  context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),

                    )),)




            ],
          ),
        ),
      );
  }
}