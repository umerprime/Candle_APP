import 'package:candle/bindings.dart';
import 'package:candle/ui/passing_day/pasing_day.dart';
import 'package:candle/ui/pray/pray.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Prayer extends StatefulWidget {
  Deseased deseased;
  Prayer(this.deseased);
  @override
  _welcomeJewishPageState createState() => _welcomeJewishPageState();
}

class _welcomeJewishPageState extends State<Prayer> {
  final notifier = Get.find<CandleViewModel>();
  String userId;

  @override
  void initState() {
    displayName_two().then((value) => {});
  }

  Future displayName_two() async {
    var value = await FirebaseAuth.instance.currentUser;
    print(value.displayName + "usssss");
    userId = value.uid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width * 1,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(widget.deseased.candleType == "jewish"
              ? "assets/images/CandleTypes/bg_yarzhiet.png"
              : widget.deseased.candleType == "general"
                  ? "assets/images/CandleTypes/bg_generic.png"
                  : "assets/images/CandleTypes/bg_catholic.png"),
          fit: BoxFit.fill,
        ),
        //color: Colors.green,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(PrayTabs(widget.deseased));
                    },
                    child: Image(
                      image: new AssetImage(
                        "assets/images/_Common/Icons/Prayer_book.png",
                      ),
                      height: 60,
                      width: 60,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.to(PrayTabs(widget.deseased));
                    },
                    child: Center(
                      child: Text('Prayers',
                          style: GoogleFonts.zillaSlab(
                            textStyle: TextStyle(
                                fontSize:
                                    18 * MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
                  // widget.deseased.candleType!="general"?   Container(
                  //   height: 50,
                  //   width: 2,
                  //   color: Colors.black,
                  // ):Container(),

                  Opacity(
                    opacity: notifier.todayIsAnnivarcary ? 1 : 0.5,
                    child: GestureDetector(
                      onTap: () {
                        // if(notifier.todayIsAnnivarcary) {
                        //   notifier.lightCanldle(
                        //       widget.deseased.candleType, widget.deseased);
                        //   Get.to(PassingDay(widget.deseased),
                        //       binding: CandleBindings());
                        // }
                        if (notifier.todayIsAnnivarcary) {
                          if (widget.deseased.candleLighted != null &&
                              widget.deseased.candleLighted) {
                            notifier.lightCanldle(
                                widget.deseased.candleType, widget.deseased);
                            Get.to(PassingDay(widget.deseased),
                                    binding: CandleBindings())
                                .then((value) {
                              setState(() {
                                widget.deseased.candleLighted = true;
                              });
                            });
                          } else {
                            if (widget.deseased.userId == userId) {
                              notifier.lightCanldle(
                                  widget.deseased.candleType, widget.deseased);
                              Get.to(PassingDay(widget.deseased),
                                      binding: CandleBindings())
                                  .then((value) {
                                setState(() {
                                  widget.deseased.candleLighted = true;
                                });
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "Only the person who created the candle can light the candle",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                        }
                      },
                      child: Image(
                        image: new AssetImage(
                          "assets/images/CandleTypes/Generic_Candle.png",
                        ),
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),

                  Opacity(
                    opacity: notifier.todayIsAnnivarcary ? 1 : 0.5,
                    child: GestureDetector(
                      onTap: () {
                        if (notifier.todayIsAnnivarcary) {
                          if (widget.deseased.candleLighted != null &&
                              widget.deseased.candleLighted) {
                            notifier.lightCanldle(
                                widget.deseased.candleType, widget.deseased);
                            Get.to(PassingDay(widget.deseased),
                                    binding: CandleBindings())
                                .then((value) {
                              setState(() {
                                widget.deseased.candleLighted = true;
                              });
                            });
                          } else {
                            if (widget.deseased.userId == userId) {
                              notifier.lightCanldle(
                                  widget.deseased.candleType, widget.deseased);
                              Get.to(PassingDay(widget.deseased),
                                      binding: CandleBindings())
                                  .then((value) {
                                setState(() {
                                  widget.deseased.candleLighted = true;
                                });
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "Only the person who created the candle can light the candle",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.080,
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: Center(
                          child: Text(
                              widget.deseased.candleLighted == null
                                  ? 'Light Candle'
                                  : "Show Candle",
                              style: GoogleFonts.zillaSlab(
                                textStyle: TextStyle(
                                    fontSize: 18 *
                                        MediaQuery.textScaleFactorOf(context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
