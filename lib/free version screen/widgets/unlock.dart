import 'dart:io';

import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'play_music.dart';

class Unlock extends StatefulWidget {
  Deseased deseased;
  String type;
  Unlock(this.deseased, this.type);
  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<Unlock> {
  bool isSwitched = false;
  final notifier = Get.find<CandleViewModel>();

  Future<dynamic> _getPromos;
  List<String> urls = [];
  List<String> tags_lists = [];
  List<String> name_list = [];
  TextEditingController nameController = TextEditingController();

  List<String> options = [];
  String tagText = "";
  bool imagesLoader = false;
  bool createPromotionloader = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  void initState() {
    if (widget.deseased != null) {
      if (widget.deseased.deceasedInvites != null) {
        widget.deseased.deceasedInvites.forEach((element) {
          tags_lists.add(element.deceasedEmail);
          name_list.add(element.deceasedName);
        });

        isSwitched = true;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            if (!notifier.upgradedAccount) {
              _showDialog();
            } else {
              notifier.showDialogue(context);
              FirebaseStorage _storage = FirebaseStorage.instance;
              FilePickerResult audioFile = await FilePicker.platform.pickFiles(
                type: FileType.audio,
              );
              File file = File(audioFile.files.single.path);
               var reference =
                  _storage.ref().child(notifier.candleId + "_music");

              //Upload the file to firebase
              var uploadTask = reference.putFile(file);

              // Waits till the file is uploaded then stores the download url
              dynamic location =
                  await (await uploadTask).ref.getDownloadURL();
              print(location.toString() + "pathhhhhh");

              notifier.deceasedMusic = location;
              Navigator.pop(context);
              setState(() {});
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.49,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.14,
                    child: Center(
                      child: Text('Select Music',
                          style: GoogleFonts.zillaSlab(
                            textStyle: TextStyle(
                                fontSize:
                                    16 * MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ),
              ),
              notifier.deceasedMusic != null
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                      child: Image(
                        image: new AssetImage(
                          "assets/images/_Common/UIElements/Cir_button_green.png",
                        ),
                        height: 35,
                        width: 35,
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                child: notifier.deceasedMusic == null
                    ? Center(
                        child: Image(
                          image: new AssetImage(
                            "assets/images/_Common/Icons/Music_symbol.png",
                          ),
                          height: 50,
                          width: 50,
                        ),
                      )
                    : Center(
                        child: PlayButton(id: "1", url: notifier.deceasedMusic),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: !notifier.upgradedAccount
                    ? Center(
                        child: Image(
                          image: new AssetImage(
                            "assets/images/_Common/UIElements/Lock.png",
                          ),
                          height: 70,
                          width: 70,
                        ),
                      )
                    : Container(),
              ),
            ]),
          ),
        ),
        InkWell(
          onTap: () {
            if (!notifier.upgradedAccount) {
              _showDialog();
            } else {
              _showInvitesDialog();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.49,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: Text("Invite Others",
                          style: GoogleFonts.zillaSlab(
                            textStyle: TextStyle(
                                fontSize:
                                    16 * MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ),
              ),
              notifier.deceasedInvites.length != 0
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                      child: Image(
                        image: new AssetImage(
                          "assets/images/_Common/UIElements/Cir_button_green.png",
                        ),
                        height: 35,
                        width: 35,
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: !notifier.upgradedAccount
                    ? Center(
                        child: Image(
                          image: new AssetImage(
                            "assets/images/_Common/UIElements/Lock.png",
                          ),
                          height: 70,
                          width: 70,
                        ),
                      )
                    : Container(),
              ),

              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0,0,80,0),
              //
              //   child: Center(
              //     child: Switch(
              //       value: isSwitched,
              //       onChanged: (value){
              //         setState(() {
              //           isSwitched=value;
              //           print(isSwitched);
              //         });
              //       },
              //       inactiveTrackColor:Colors.deepOrange,
              //       activeTrackColor: Colors.lightGreenAccent,
              //       activeColor: Colors.green,
              //     ),
              //   ),
              // ),
            ]),
          ),
        ),
      ],
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
                                notifier.makePayment();
                              },
                              child: Center(
                                child: Text('UPGRADE Test 5',
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

// notifier. upgradeData();
  void _showInvitesDialog() {
    showDialog(
      context: context,
      //    barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: Colors.black87,
            elevation: 0,
            content: StatefulBuilder(
                builder: (thisLowerContext, StateSetter customerinfo) {
              StateSetter customerInfoState;
              customerInfoState = customerinfo;
              return Container(
                width: MediaQuery.of(context).size.width * 50,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    // Positioned(
                    //   right: -40.0,
                    //   top: -40.0,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Get.back();
                    //     },
                    //     child: CircleAvatar(
                    //       child: GestureDetector(
                    //           onTap: () {
                    //             Get.back();
                    //           },
                    //           child: Icon(Icons.close)),
                    //       backgroundColor: Colors.red,
                    //     ),
                    //   ),
                    // ),
                    Form(
                      //    key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 80,
                                constraints: new BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 20,
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 40,
                                ),
                                child: Tags(
                                  textField: TagsTextField(
                                      maxLength: 50,
                                      hintText: "Add Emails",
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      hintTextColor: Colors.white,
                                      suggestionTextColor: Colors.white,
                                      constraintSuggestion: true,
                                      suggestions: [],
                                      //width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 10),
                                      onSubmitted: (String str) {
                                        // Add item to the data source.
                                        if (mounted) {
                                          customerInfoState(() {
                                            // required
                                            if (EmailValidator.validate(
                                                tagText)) {
                                              tags_lists.add(tagText);
                                              tagText = "";
                                            }
                                          });
                                        }
                                      },
                                      onChanged: (String str) {
                                        if (mounted) {
                                          customerInfoState(() {
                                            tagText = str;
                                          });
                                        }
                                      }),

                                  itemCount: tags_lists.length,
                                  // required
                                  itemBuilder: (int index) {
                                    final item = tags_lists[index];

                                    return ItemTags(
                                      // Each ItemTags must contain a Key. Keys allow Flutter to
                                      // uniquely identify widgets.
                                      key: Key(index.toString()),
                                      index: index,
                                      // required
                                      title: item,
                                      // active: item.active,
                                      // customData: item.customData,
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                      ),
                                      combine: ItemTagsCombine.withTextBefore,
                                      // image: ItemTagsImage(
                                      //     image: AssetImage("img.jpg") // OR NetworkImage("https://...image.png")
                                      // ), // OR null,

                                      // OR null,
                                      removeButton: ItemTagsRemoveButton(
                                        onRemoved: () {
                                          // Remove the item from the data source.

                                          customerInfoState(() {
                                            // required
                                            tags_lists.removeAt(index);
                                          });
                                          //required
                                          return true;
                                        },
                                      ),
                                      // OR null,
                                      onPressed: (item) => print(item),
                                      onLongPressed: (item) => print(item),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: TextField(
                                  controller: nameController,
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (t) {
                                    customerInfoState(() {});
                                  },
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      height: 1.5,
                                      color: Colors.white),
                                  decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 0.0),
                                      ),
                                      border: const OutlineInputBorder(),
                                      hintText: 'Add Name',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)
                                      //icon: new Icon(Icons.lock,size: 18.0,),
                                      ),
                                ),
                              ),
                              SizedBox(height: 10),
                              EmailValidator.validate(tagText) &&
                                      nameController.text != ""
                                  ? FloatingActionButton(
                                      onPressed: () {
                                        customerInfoState(() {
                                          // required
                                          if (EmailValidator.validate(
                                                  tagText) &&
                                              nameController.text != "") {
                                            tags_lists.add(tagText);
                                            name_list.add(nameController.text);
                                            nameController.text = "";
                                            tagText = "";
                                            customerInfoState = null;
                                            Navigator.pop(context);
                                            _showInvitesDialog();
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: nameController.text != ""
                                                    ? "Invalid Format!"
                                                    : "Please Enter Name",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        });
                                      },
                                      child: Text("Add",
                                          style: GoogleFonts.zillaSlab(
                                            textStyle: TextStyle(
                                              fontSize: 14 *
                                                  MediaQuery.textScaleFactorOf(
                                                      context),
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          )),
                                    )
                                  : Container(),
                            ],
                          ),
                          tags_lists.length > 0
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: !createPromotionloader
                                      ? RaisedButton(
                                          child: Text("Submit"),
                                          onPressed: () {
                                            if (tags_lists.length != 0) {
                                              for (int i = 0;
                                                  i < tags_lists.length;
                                                  i++) {
                                                notifier.deceasedInvites.add(
                                                    new DeceasedInvites(
                                                        deceasedEmail:
                                                            tags_lists[i],
                                                        deceasedName:
                                                            name_list[i]));
                                              }

                                              setState(() {});
                                              Get.back();
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Please add emails before submit!",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }
                                          })
                                      : CircularProgressIndicator(),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
      },
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
                        Text('Are you sure you want to delete current account?',
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
                            notifier.deleteAccount();
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
