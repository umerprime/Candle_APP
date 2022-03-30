import 'package:candle/bindings.dart';
import 'package:candle/ui/home_screen.dart';
import 'package:candle/ui/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(new GetMaterialApp(
    localizationsDelegates: [GlobalMaterialLocalizations.delegate],
    supportedLocales: [
      const Locale('en'), // English
      const Locale('he', "US"),
      const Locale('fr') // Hebrew
      // Chinese *See Advanced Locales below*
      // ... other locales the app supports
    ],
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State {
  var _alignment = Alignment.bottomCenter;
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        _alignment = Alignment.center;
      });

      setState(() {
        // Here you can write your code for open new view
      });
    });
    new Future.delayed(const Duration(seconds: 5), () => getLandingPage());
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //backgroundColor: Colors.white,
        body: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage("assets/images/_Common/BGs/Bg.jpg"),
              fit: BoxFit.fill,
            )),
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: opacity == 1 ? 0 : 1,
                  duration: Duration(seconds: 1),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                          ),
                          Container(
                            //color: Colors.blue,
                            child: Text('VIRTUAL',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                    fontSize: 30 *
                                        MediaQuery.textScaleFactorOf(context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[50],
                                  ),
                                )),
                          ),
                          Container(
                            //color: Colors.green,
                            child: Text('MEMORY CANDLES',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 30 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[50]),
                                )),
                          ),
                        ]),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    alignment: _alignment,
                    child: Container(
                      height: 600,
                      width: 300,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Column(
                          children: [
                            Image.asset(
                                "assets/images/_Common/Candle/fire_spin.gif",
                                gaplessPlayback: true,
                                height: 150,
                                fit: BoxFit.fitWidth),
                            Image.asset(
                                "assets/images/_Common/Candle/globe_spin.gif",
                                height: 230,
                                gaplessPlayback: true,
                                fit: BoxFit.fitWidth),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }

  getLandingPage() async {
    var value = await FirebaseAuth.instance.currentUser;
    if (value != null && value.uid != null) {
      Get.to(HomePage(), binding: CandleBindings());
    } else {
      Get.to(LoginPage(), binding: AuthBindings());
    }
  }
}
