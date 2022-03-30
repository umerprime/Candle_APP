import 'dart:io';

import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePhoto extends StatefulWidget {
  Deseased deseased;
  String type;
  ProfilePhoto(this.deseased, this.type);
  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<ProfilePhoto> {
  bool isSwitched = false;
  final notifier = Get.find<CandleViewModel>();
  String _imageUrl;
  @override
  Widget build(BuildContext context) {
    if (widget.deseased != null) {
      notifier.candleId = widget.deseased.candleId;
    }
    print(notifier.candleId + "cccccc");
    return InkWell(
      onTap: () async {
        if (!notifier.upgradedAccount) {
          _showDialog();
        } else {
          FirebaseStorage _storage = FirebaseStorage.instance;
          FilePickerResult image = await FilePicker.platform.pickFiles(
            type: FileType.image,
          );
          File file = File(image.files.single.path);
          notifier.showDialogue(context);
          var reference = _storage.ref().child(notifier.candleId + "_image");

          //Upload the file to firebase
          var uploadTask = reference.putFile(file);

          // Waits till the file is uploaded then stores the download url
          dynamic location = await (await uploadTask).ref.getDownloadURL();
          print(location.toString() + "pathhhhhh");

          notifier.deceasedPhoto = location;

          Navigator.pop(context);
          setState(() {});
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.140,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(widget.type == "jewish"
                ? "assets/images/CandleTypes/bg_yarzhiet.png"
                : widget.type == "general"
                    ? "assets/images/CandleTypes/bg_generic.png"
                    : "assets/images/CandleTypes/bg_catholic.png"),
            fit: BoxFit.fill,
          ),
          //color: Colors.green,
        ),
        child: Stack(children: [
          Stack(children: [
            Center(
                child: notifier.deceasedPhoto == null
                    ? Text('Select Photo',
                        style: GoogleFonts.zillaSlab(
                          textStyle: TextStyle(
                              fontSize:
                                  13 * MediaQuery.textScaleFactorOf(context),
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.140,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Image.network(
                          notifier.deceasedPhoto,
                          fit: BoxFit.cover,
                          height: 65,
                          width: 65,
                        ))),
            !notifier.upgradedAccount
                ? Center(
                    child: Image(
                      image: new AssetImage(
                        "assets/images/_Common/UIElements/Lock.png",
                      ),
                      height: 65,
                      width: 65,
                    ),
                  )
                : Container(),
          ]),
          // notifier.deceasedMusic!=null? Padding(
          //   padding: const EdgeInsets.fromLTRB(0,0,50,0),
          //   child: Image(image: new AssetImage( "assets/images/_Common/UIElements/Cir_button_green.png",
          //   ),height: 35,width: 35,),
          // ):Container(),
        ]),
      ),
    );
  }

  void _showDialog() {
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
                    child: Text('Please upgrade to use this feature. ',
                        style: GoogleFonts.zillaSlab(
                          textStyle: TextStyle(
                              fontSize:
                                  20 * MediaQuery.textScaleFactorOf(context),
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
                            Navigator.pop(context);
                            notifier.makePayment();
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
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Text('UPGRADE Test 4',
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
                                child: Text('CANCEL',
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
