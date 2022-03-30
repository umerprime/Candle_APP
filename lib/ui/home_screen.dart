import 'package:candle/bindings.dart';
import 'package:candle/candle%20templetes/candle_templete.dart';
import 'package:candle/ui/candle/candle_detail.dart';
import 'package:candle/ui/login_screen.dart';
import 'package:candle/ui/user_settings.dart';
import 'package:candle/utils/text.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  bool _isHidden = true;
  final notifier = Get.find<CandleViewModel>();
  Future<CandleDataModel> getCandles;
  Future<CandleDataModel> getUsersCandles;
  var authuser;
  @override
  void initState() {
    getCandles = notifier.getAllCandles();
    getUsersCandles = notifier.getUsersCandles();

    //cathelic
    //general
    //jewish
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 1,
                  //color: Colors.green,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width * 0.25,
                          //color: Colors.red,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Image(
                                image: new AssetImage(
                              "assets/images/_Common/Candle/Candle_00000.png",
                            )),
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                //color: Colors.blue,
                                height:
                                    MediaQuery.of(context).size.height * 0.050,
                                child: Text('VIRTUAL',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                        fontSize: 25 *
                                            MediaQuery.textScaleFactorOf(
                                                context),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[50],
                                      ),
                                    )),
                              ),
                              Container(
                                //color: Colors.green,
                                height:
                                    MediaQuery.of(context).size.height * 0.050,
                                child: Text('MEMORY CANDLES',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 25 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[50]),
                                    )),
                              ),
                            ])
                      ]),
                ),

                FutureBuilder<CandleDataModel>(
                  future: getUsersCandles,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data.deseased != null) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.50,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.deseased.length,
                              itemBuilder: (_, index) {
                                String candleType =
                                    snapshot.data.deseased[index].candleType;
                                bool showcandle = false;
                                bool notMine = false;
                                String email = "";
                                String userID = "";

                                userID = notifier.firebaseUser.uid;
                                email = notifier.firebaseUser.email;

                                if (snapshot.data.deseased[index].userId ==
                                    userID) {
                                  showcandle = true;
                                }
                                if (snapshot
                                        .data.deseased[index].deceasedInvites !=
                                    null) {
                                  for (int i = 0;
                                      i <
                                          snapshot.data.deseased[index]
                                              .deceasedInvites.length;
                                      i++) {
                                    if (snapshot.data.deseased[index]
                                            .deceasedInvites[i].deceasedEmail ==
                                        email) {
                                      showcandle = true;
                                      notMine = true;
                                    }
                                  }
                                }
                                return showcandle
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              CandleDetailScreen(snapshot
                                                  .data.deseased[index]),
                                              binding: CandleBindings());
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.10,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: candleType == "general"
                                                      ? AssetImage(
                                                          "assets/images/CandleTypes/bg_generic.png",
                                                        )
                                                      : candleType == "cathelic"
                                                          ? AssetImage(
                                                              "assets/images/CandleTypes/bg_catholic.png",
                                                            )
                                                          : AssetImage(
                                                              "assets/images/CandleTypes/bg_yarzhiet.png",
                                                            ),
                                                  fit: BoxFit.fill),
                                              //color: Colors.red
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 0, 0, 0),
                                                    child: snapshot
                                                                .data
                                                                .deseased[index]
                                                                .deceasedPhoto ==
                                                            null
                                                        ? Image(
                                                            image:
                                                                new AssetImage(
                                                              "assets/images/_Common/Icons/Cir_photo_empty.png",
                                                            ),
                                                            height: 250,
                                                          )
                                                        : CircleAvatar(
                                                            radius: 40.0,
                                                            backgroundImage:
                                                                NetworkImage(snapshot
                                                                    .data
                                                                    .deseased[
                                                                        index]
                                                                    .deceasedPhoto),
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                          )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 150,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              snapshot
                                                                  .data
                                                                  .deseased[
                                                                      index]
                                                                  .deceasedName,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: GoogleFonts
                                                                  .zillaSlab(
                                                                textStyle: TextStyle(
                                                                    fontSize: 15 *
                                                                        MediaQuery.textScaleFactorOf(
                                                                            context),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white),
                                                              )),
                                                        ),
                                                      ),
                                                      Text(
                                                          snapshot
                                                              .data
                                                              .deseased[index]
                                                              .deceasedDate,
                                                          style: GoogleFonts
                                                              .zillaSlab(
                                                            textStyle: TextStyle(
                                                                fontSize: 15 *
                                                                    MediaQuery
                                                                        .textScaleFactorOf(
                                                                            context),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                      notMine
                                                          ? Text(
                                                              "By: " +
                                                                  snapshot
                                                                      .data
                                                                      .deseased[
                                                                          index]
                                                                      .userName,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .zillaSlab(
                                                                textStyle: TextStyle(
                                                                    fontSize: 15 *
                                                                        MediaQuery.textScaleFactorOf(
                                                                            context),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .white),
                                                              ))
                                                          : Container(),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 0),
                                                  child: Image(
                                                    image:
                                                        candleType == "general"
                                                            ? AssetImage(
                                                                "assets/images/CandleTypes/Generic_Candle.png",
                                                              )
                                                            : candleType ==
                                                                    "cathelic"
                                                                ? AssetImage(
                                                                    "assets/images/CandleTypes/Catholic_Cross.png",
                                                                  )
                                                                : AssetImage(
                                                                    "assets/images/CandleTypes/Jewish_Star.png",
                                                                  ),
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container();
                              }),
                        );
                      } else {
                        return Center(
                          child: AppText(
                            text: 'No Candle Found',
                            type: TextType.title,
                            color: Colors.white,
                          ),
                        );
                      }
                    } else {
                      return Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 2,
                            itemBuilder: (_, index) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.pink,
                                    ),
                                    // child: VStack([
                                    //   const SizedBox(height: 10.0),
                                    //   Container(
                                    //     height: MediaQuery
                                    //         .of(context)
                                    //         .size
                                    //         .height * 0.10,
                                    //     width: MediaQuery.of(context).size.width*0.90,
                                    //   ),
                                    // ]),
                                  )
                                  //  ).shimmer(),
                                  );
                            }),
                      );
                    }
                  },
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Templete_Page(),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage(
                                "assets/images/CandleTypes/Empty_but.png",
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
                              child: Image(
                                image: new AssetImage(
                                  "assets/images/_Common/Icons/Cir_photo_empty.png",
                                ),
                                height: 250,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Center(
                                child: Text('CREATE NEW CANDLE',
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 17 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserSettings()));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.065,
                            width: MediaQuery.of(context).size.width * 0.53,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: new AssetImage(
                                    "assets/images/_Common/UIElements/Button.png",
                                  ),
                                  fit: BoxFit.fill),
                              //color: Colors.red
                            ),
                            child: Center(
                              child: Text('USER SETTINGS',
                                  style: GoogleFonts.zillaSlab(
                                    textStyle: TextStyle(
                                        fontSize: 17 *
                                            MediaQuery.textScaleFactorOf(
                                                context),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Get.to(LoginPage(), binding: AuthBindings());
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.065,
                            width: MediaQuery.of(context).size.width * 0.32,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: new AssetImage(
                                    "assets/images/_Common/UIElements/Button.png",
                                  ),
                                  fit: BoxFit.fill),
                              //color: Colors.red
                            ),
                            child: Center(
                              child: Text('LOGOUT',
                                  style: GoogleFonts.zillaSlab(
                                    textStyle: TextStyle(
                                        fontSize: 17 *
                                            MediaQuery.textScaleFactorOf(
                                                context),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                //row for button at bottom
              ])),
    ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
