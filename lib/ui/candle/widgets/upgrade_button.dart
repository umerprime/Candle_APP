
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:candle/viewmodels/candle_data_model.dart';

class UpgradeButton extends StatefulWidget {

  final String title;
  final String UpgradeIcon;
  Deseased deseased;

  UpgradeButton({@required this.title,this.UpgradeIcon,this.deseased});
  @override
  _welcomeJewishPageState createState() => _welcomeJewishPageState();
}

class _welcomeJewishPageState extends State<UpgradeButton> {

  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {
    return

      Stack(
          children:[

            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.080,
              width: MediaQuery.of(context).size.width*0.90,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage( widget.deseased.candleType=="jewish"? "assets/images/CandleTypes/bg_yarzhiet.png":
                  widget.deseased.candleType=="general"?"assets/images/CandleTypes/bg_generic.png":"assets/images/CandleTypes/bg_catholic.png",),
                  fit: BoxFit.fill,
                ),
                //color: Colors.green,
              ),
            ),


            Image(image: new AssetImage(widget.UpgradeIcon,
              //"assets/images/_Common/Icons/Music_symbol.png",
            ),height: 45,width: 60,),


            Center(
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.080,
                width: MediaQuery.of(context).size.width*0.54,

                child: Center(
                  child: Text(widget.title,
                      style: GoogleFonts.zillaSlab(
                        textStyle: TextStyle(
                            fontSize: 18*
                                MediaQuery.textScaleFactorOf(
                                    context),
                            fontWeight: FontWeight.normal,
                            color: Colors.white
                        ),

                      )),
                ),
              ),
            ),




          ]
      );


  }

}