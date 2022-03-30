import 'package:candle/bindings.dart';
import 'package:candle/ui/home_screen.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Bottom_Navbar extends StatefulWidget {
  Deseased deseased;

  String type;
  Bottom_Navbar(this.type, this.deseased);
  @override
  _welcomeUserCathelicPageState createState() =>
      _welcomeUserCathelicPageState();
}

class _welcomeUserCathelicPageState extends State<Bottom_Navbar> {
  final notifier = Get.find<CandleViewModel>();
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
              if (notifier.deceasedName != "" && notifier.deceasedTime != "") {
                notifier.showDialogue(context);
                notifier.uploadData(widget.type, widget.deseased);
              } else {
                if (notifier.deceasedTime == "" &&
                    notifier.deceasedName == "") {
                  Fluttertoast.showToast(
                      msg:
                          "Deceased date and Name of deceased needs to be filled out",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {
                  if (notifier.deceasedTime == "") {
                    Fluttertoast.showToast(
                        msg: "Deceased date needs to be filled out",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (notifier.deceasedName == "") {
                    Fluttertoast.showToast(
                        msg: "Name of deceased needs to be filled in",
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
                "assets/images/_Common/Icons/Fornt_button.png",
              ),
              height: 45,
              width: 45,
            ),
          ),
        ],
      ),
    );
  }
}
