import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:candle/free version screen/widgets/play_music.dart';
import 'package:candle/ui/pray/pray.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animations/loading_animations.dart';

class PassingDay extends StatefulWidget {
  @override
  _welcomeJewishPageState createState() => _welcomeJewishPageState();
  Deseased deseased;
  PassingDay(this.deseased);
}

class _welcomeJewishPageState extends State<PassingDay> {
  String formatted;
  final notifier = Get.find<CandleViewModel>();
  bool _passwordVisible = false;
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 1,
                // color: Colors.red,
                child: Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: widget.deseased.deceasedPhoto == null
                        ? Image(
                            image: new AssetImage(
                              "assets/images/_Common/Icons/Cir_photo_empty.png",
                            ),
                            height: 200,
                            width: 300,
                          )
                        : CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                                NetworkImage(widget.deseased.deceasedPhoto),
                            backgroundColor: Colors.transparent,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(110, 13, 0, 0),
                          child: Image(
                            image: new AssetImage(
                              "assets/fires.gif",
                            ),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 40, 0, 0),
                          child: Image(
                            image: new AssetImage(
                              "assets/images/_Common/Icons/bottle_candle.png",
                            ),
                            height: 200,
                            width: 300,
                          ),
                        ),
                        Row(
                          children: [
                            Center(
                              child: PlayButton(
                                  id: widget.deseased.candleId,
                                  url: widget.deseased.deceasedMusic),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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
                ]),
              ),

              widget.deseased.deceasedfiles == null
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                    )
                  : GetBuilder<CandleViewModel>(
                      builder: (notifier) => Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: widget.deseased.deceasedfiles != null
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      widget.deseased.deceasedfiles.length,
                                  itemBuilder: (_, index) {
                                    return Column(children: [
                                      Stack(
                                        children: [
                                          widget.deseased.deceasedfiles[index]
                                                  .contains("image")
                                              ? Container(
                                                  margin: EdgeInsets.all(10.0),
                                                  padding: EdgeInsets.all(10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(15.0),
                                                      topRight:
                                                          Radius.circular(15.0),
                                                      bottomLeft:
                                                          Radius.circular(15.0),
                                                      bottomRight:
                                                          Radius.circular(15.0),
                                                    ),
                                                    child: Image.network(widget
                                                        .deseased
                                                        .deceasedfiles[index]),
                                                  ),
                                                )
                                              : Container(
                                                  color: Colors.black,
                                                  child: ListTile(
                                                    leading: PlayButton(
                                                        id: widget.deseased
                                                                .deceasedfiles[
                                                            index],
                                                        url: widget.deseased
                                                                .deceasedfiles[
                                                            index]),
                                                    title: Text(
                                                      "Play Music",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17),
                                                    ),
                                                  ),
                                                )
                                        ],
                                      ),
                                    ]);
                                  })
                              : Container())),

              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(widget.deseased.deceasedName,
                          style: GoogleFonts.zillaSlab(
                            textStyle: TextStyle(
                                fontSize:
                                    16 * MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                    Center(
                      child: Text('Passed Away $formatted',
                          style: GoogleFonts.zillaSlab(
                            textStyle: TextStyle(
                                fontSize:
                                    16 * MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          )),
                    ),
                    Center(
                      child: Text(widget.deseased.deceasedMessage,
                          style: GoogleFonts.zillaSlab(
                            textStyle: TextStyle(
                                fontSize:
                                    16 * MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),

              // SizedBox(height: MediaQuery
              //     .of(context)
              //     .size
              //     .height * 0.050,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible ? Icons.edit : Icons.edit_off,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  _passwordVisible
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            GestureDetector(
                              onTap: () async {
                                FirebaseStorage _storage =
                                    FirebaseStorage.instance;
                                FilePickerResult image =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.image,
                                );
                                showDialogue();
                                File file = File(image.files.single.path);

                                var reference = _storage
                                    .ref()
                                    .child(widget.deseased.candleId + "_image");

                                //Upload the file to firebase
                                var uploadTask =
                                    reference.putFile(file);

                                // Waits till the file is uploaded then stores the download url
                                dynamic location =
                                    await (await uploadTask)
                                        .ref
                                        .getDownloadURL();
                                print(location.toString() + "pathhhhhh");
                                if (widget.deseased.deceasedfiles == null) {
                                  widget.deseased.deceasedfiles = [];
                                }
                                widget.deseased.deceasedfiles.add(location);
                                notifier.addFilesInCanldle(
                                    widget.deseased.candleType,
                                    widget.deseased,
                                    location);
                                Navigator.pop(context);
                                setState(() {});
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
                                  child: Text('Upload Image',
                                      style: GoogleFonts.zillaSlab(
                                        textStyle: TextStyle(
                                            fontSize: 13 *
                                                MediaQuery.textScaleFactorOf(
                                                    context),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                FirebaseStorage _storage =
                                    FirebaseStorage.instance;
                                FilePickerResult audioFile =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.audio,
                                );
                                File file = File(audioFile.files.single.path);
                                showDialogue();
                                var reference = _storage
                                    .ref()
                                    .child(widget.deseased.candleId + "_music");

                                //Upload the file to firebase
                                var uploadTask = reference.putFile(file);

                                // Waits till the file is uploaded then stores the download url
                                dynamic location =
                                    await (await uploadTask)
                                        .ref
                                        .getDownloadURL();
                                print(location.toString() + "pathhhhhh");
                                if (widget.deseased.deceasedfiles == null) {
                                  widget.deseased.deceasedfiles = [];
                                }
                                widget.deseased.deceasedfiles.add(location);
                                notifier.addFilesInCanldle(
                                    widget.deseased.candleType,
                                    widget.deseased,
                                    location);
                                Navigator.pop(context);
                                setState(() {});
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
                                  child: Text('Upload Music',
                                      style: GoogleFonts.zillaSlab(
                                        textStyle: TextStyle(
                                            fontSize: 13 *
                                                MediaQuery.textScaleFactorOf(
                                                    context),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(PrayTabs(widget.deseased));
                              },
                              child: Image(
                                image: new AssetImage(
                                  "assets/images/_Common/Icons/Prayer_book.png",
                                ),
                                height: 45,
                                width: 45,
                              ),
                            ),
                          ],
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.060,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDialogue() {
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
                    child: Text('Loading please wait',
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.030,
                        ),
                        LoadingBouncingGrid.circle(
                          borderColor: Colors.blueGrey,
                          borderSize: 3.0,
                          size: 50.0,
                          backgroundColor: Colors.blueGrey,
                          duration: Duration(milliseconds: 5000),
                        )
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
