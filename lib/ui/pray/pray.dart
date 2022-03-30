import 'package:candle/ui/pray_detail/pray_detail.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PrayTabs extends StatefulWidget {
  Deseased deseased;
  PrayTabs(this.deseased);
  @override
  _welcomeJewishPageState createState() => _welcomeJewishPageState();
}

class _welcomeJewishPageState extends State<PrayTabs> {
  String formatted;
  @override
  void initState() {
    var inputFormat = DateFormat('MM/dd/yyyy');
    DateTime date1 = inputFormat.parse(widget.deseased.deceasedDate);
    var outputFormat = DateFormat('MMM d, ' 'yyy');
    var date2 = outputFormat.format(date1); // 2019-08-18
    formatted = date2; // something
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage("assets/images/_Common/BGs/Bg.jpg"),
            fit: BoxFit.fill,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage(
                        widget.deseased.candleType == "jewish"
                            ? "assets/images/CandleTypes/Top_band_Jewish.png"
                            : widget.deseased.candleType == "general"
                                ? "assets/images/CandleTypes/Top_band_Generic.png"
                                : "assets/images/CandleTypes/Top_band_Catholic.png",
                      ),
                      fit: BoxFit.fill),
                  //color: Colors.red
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: widget.deseased.deceasedPhoto == null
                            ? Image(
                                image: new AssetImage(
                                  "assets/images/_Common/Icons/Cir_photo_empty.png",
                                ),
                                height: 70,
                                width: 70,
                              )
                            : CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    NetworkImage(widget.deseased.deceasedPhoto),
                                backgroundColor: Colors.transparent,
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(widget.deseased.deceasedName,
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                )),
                          ),
                          Center(
                            child: Text('Passed Away $formatted',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.deseased.candleType == "cathelic" ||
                            widget.deseased.candleType == "general"
                        ? InkWell(
                            onTap: () {
                              Get.to(PrayDetail(widget.deseased, "Prayer"));
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.070,
                              width: MediaQuery.of(context).size.width * 0.70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: new AssetImage(
                                      "assets/images/_Common/UIElements/Button.png",
                                    ),
                                    fit: BoxFit.fill),
                                //color: Colors.red
                              ),
                              child: Center(
                                child: Text('Prayer',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 18 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )),
                              ),
                            ),
                          )
                        : Container(),
                    if (widget.deseased.candleType != "cathelic" &&
                        widget.deseased.candleType != "general")
                      InkWell(
                        onTap: () {
                          Get.to(PrayDetail(widget.deseased, "Hebrew"));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.070,
                          width: MediaQuery.of(context).size.width * 0.70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage(
                                  "assets/images/_Common/UIElements/Button.png",
                                ),
                                fit: BoxFit.fill),
                            //color: Colors.red
                          ),
                          child: Center(
                            child: Text('Hebrew',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                        ),
                      ),
                    if (widget.deseased.candleType != "cathelic" &&
                        widget.deseased.candleType != "general")
                      InkWell(
                        onTap: () {
                          Get.to(PrayDetail(widget.deseased, "English"));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.070,
                          width: MediaQuery.of(context).size.width * 0.70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage(
                                  "assets/images/_Common/UIElements/Button.png",
                                ),
                                fit: BoxFit.fill),
                            //color: Colors.red
                          ),
                          child: Center(
                            child: Text('English',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                        ),
                      ),
                    if (widget.deseased.candleType != "cathelic" &&
                        widget.deseased.candleType != "general")
                      InkWell(
                        onTap: () {
                          Get.to(PrayDetail(widget.deseased, "EnglishOne"));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.070,
                          width: MediaQuery.of(context).size.width * 0.70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage(
                                  "assets/images/_Common/UIElements/Button.png",
                                ),
                                fit: BoxFit.fill),
                            //color: Colors.red
                          ),
                          child: Center(
                            child: Text('English Transliteration',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.050,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.050,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
