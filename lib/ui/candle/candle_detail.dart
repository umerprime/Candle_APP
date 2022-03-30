import 'package:candle/bindings.dart';
import 'package:candle/free%20version%20screen/free_versionCathelic.dart';
import 'package:candle/free%20version%20screen/free_versionGeneral.dart';
import 'package:candle/free%20version%20screen/free_versionJews.dart';
import 'package:candle/ui/candle/widgets/prayer.dart';
import 'package:candle/ui/candle/widgets/upgarde_clendar.dart';
import 'package:candle/ui/candle/widgets/upgrade_button.dart';
import 'package:candle/ui/home_screen.dart';
import 'package:candle/ui/pray_detail/pray_detail.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CandleDetailScreen extends StatefulWidget {
  Deseased deseased;
  @override
  _welcomeJewishPageState createState() => _welcomeJewishPageState();

  CandleDetailScreen(this.deseased);
}

class _welcomeJewishPageState extends State<CandleDetailScreen> {
  final notifier = Get.find<CandleViewModel>();
  String formatted;

  @override
  void initState() {
    var inputFormat = DateFormat('MM/dd/yyyy');
    DateTime date1 = inputFormat.parse(widget.deseased.deceasedDate);

    var outputFormat = DateFormat('MMM d, ' 'yyy');
    var date2 = outputFormat.format(date1); // 2019-08-18
    formatted = date2; // s

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final aDate = DateTime(date1.year, date1.month, date1.day);
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
                            child: Text("Passed Away: " + formatted,
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
                height: MediaQuery.of(context).size.height * 0.0150,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.52,
                width: MediaQuery.of(context).size.width * 0.90,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    !notifier.upgradedAccount
                        ? GestureDetector(
                            onTap: () {
                              notifier.makePayment();
                            },
                            child: UpgradeButton(
                              title: 'Upgrade to select music',
                              UpgradeIcon:
                                  "assets/images/_Common/Icons/Music_symbol.png",
                              deseased: widget.deseased,
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.010,
                    ),
                    UpgradeCalendar(widget.deseased),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.010,
                    ),
                    !notifier.upgradedAccount
                        ? GestureDetector(
                            onTap: () {
                              notifier.makePayment();
                            },
                            child: UpgradeButton(
                                title: 'Upgrade to invite guests',
                                UpgradeIcon:
                                    "assets/images/_Common/Icons/People.png",
                                deseased: widget.deseased),
                          )
                        : Container(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.010,
                    ),
                    GetBuilder<CandleViewModel>(
                        builder: (notifier) => Prayer(widget.deseased))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.050,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  !notifier.upgradedAccount
                      ? InkWell(
                          onTap: () {
                            if (!notifier.upgradedAccount) {
                              notifier.makePayment();
                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.060,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: new AssetImage(
                                    "assets/images/_Common/UIElements/Button.png",
                                  ),
                                  fit: BoxFit.fill),
                              //color: Colors.red
                            ),
                            child: InkWell(
                              onTap: () {
                                notifier.makePayment();
                              },
                              child: Center(
                                child: Text('Upgrade test 7',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 18 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  InkWell(
                    onTap: () {
                      if (widget.deseased.candleType == "jewish") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FreeVersionJews(widget.deseased)),
                        );
                      }
                      if (widget.deseased.candleType == "general") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FreeVersionGeneral(widget.deseased)),
                        );
                      }
                      if (widget.deseased.candleType == "cathelic") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FreeVersionCatholic(widget.deseased)),
                        );
                      }
                    },
                    child: Image(
                      image: new AssetImage(
                        "assets/images/_Common/Icons/Edit_but 1.png",
                      ),
                      height: 45,
                      width: 45,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _showDeleteDialog();
                    },
                    child: Image(
                      image: new AssetImage(
                        "assets/images/_Common/Icons/Delete_but 1.png",
                      ),
                      height: 45,
                      width: 45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.050,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      var value = await FirebaseAuth.instance.currentUser;
                      final Email email = Email(
                        body: 'Hi, My email address is ' + value.email,
                        subject: 'Virtual Memory Candles Query',
                        recipients: ['info@virtualmemorycandle.com'],
                        isHTML: false,
                      );

                      await FlutterEmailSender.send(email);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.060,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage(
                              "assets/images/_Common/UIElements/Button.png",
                            ),
                            fit: BoxFit.fill),
                        //color: Colors.red
                      ),
                      child: Center(
                        child: Text('Contact Us',
                            style: GoogleFonts.zillaSlab(
                              textStyle: TextStyle(
                                  fontSize: 16 *
                                      MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  InkWell(
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
                  InkWell(
                    onTap: () {
                      Get.to(PrayDetail(widget.deseased, "Disclaimer"));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.060,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage(
                                  "assets/images/_Common/UIElements/Button.png",
                                ),
                                fit: BoxFit.fill),
                            //color: Colors.red
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.060,
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Center(
                                child: Text('Disclaimer',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 16 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  void _showDeleteDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Colors.black87,
          elevation: 0,
          child: IntrinsicWidth(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child:
                        Text('Are you sure you want to delete current candle?',
                            style: GoogleFonts.zillaSlab(
                              textStyle: TextStyle(
                                  fontSize: 20 *
                                      MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.090,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            notifier.deleteData(widget.deseased);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.060,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: new AssetImage(
                                    "assets/images/_Common/UIElements/Button.png",
                                  ),
                                  fit: BoxFit.fill),
                              //color: Colors.red
                            ),
                            child: Center(
                              child: Text('YES',
                                  style: GoogleFonts.zillaSlab(
                                    textStyle: TextStyle(
                                        fontSize: 18 *
                                            MediaQuery.textScaleFactorOf(
                                                context),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.030,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.060,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: new AssetImage(
                                      "assets/images/_Common/UIElements/Button.png",
                                    ),
                                    fit: BoxFit.fill),
                                //color: Colors.red
                              ),
                              child: Center(
                                child: Text('NO',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 18 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
