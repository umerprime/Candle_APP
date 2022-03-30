
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VersionButton extends StatefulWidget {

  final String title;
  VersionButton({@required this.title});

  @override
  _welcomeUserCathelicPageState createState() => _welcomeUserCathelicPageState();
}

class _welcomeUserCathelicPageState extends State<VersionButton> {
  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.09,
          width: MediaQuery.of(context).size.width*1,
          color: Colors.blueGrey[500],

          child:

          Stack(

              children:[

                Center(
                  child:

                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.09,
                    width: MediaQuery.of(context).size.width*0.80,

                    child:
                    Image(image: new AssetImage( "assets/images/_Common/UIElements/Green_button.png",),height: 100,width: 100,),
                  ),
                ),

                Center(
                  child: Text(widget.title,
                      style: GoogleFonts.zillaSlab(
                        textStyle: TextStyle(
                            fontSize: 16*
                                MediaQuery.textScaleFactorOf(
                                    context),
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),

                      )),
                ),


              ]),
        ),


      ],
    );
  }
}