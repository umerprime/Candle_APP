import 'dart:convert';

import 'package:candle/bindings.dart';
import 'package:candle/ui/home_screen.dart';
import 'package:candle/ui/login_screen.dart';
import 'package:candle/viewmodels/base_viewmodel.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as _http;
import 'package:loading_animations/loading_animations.dart';
import 'package:square_in_app_payments/google_pay_constants.dart'
    as google_pay_constants;
import 'package:square_in_app_payments/in_app_payments.dart';

import '../utils/config.dart';

class CandleViewModel extends BaseViewmodel {
  var firebaseUser;
  String deceasedName;
  String deceasedTime;
  String deceasedMessage;
  List<DeceasedInvites> deceasedInvites = [];
  String candleId;
  String deceasedMusic;
  String deceasedPhoto;
  bool checkemail;
  bool checkphone;
  bool updateData;
  bool upgradedAccount = false;
  bool todayIsAnnivarcary = false;
  bool annivarcaryPassed = false;
  String errorMsg;
  bool isTraditionalCalander = true;
  bool beforeSunset = true;
  StateSetter calanderState;
  String chargeServerHost = "REPLACE_ME";

  bool get _chargeServerHostReplaced => chargeServerHost != "REPLACE_M";
  BuildContext context;

  void uploadData(String type, Deseased deseased) async {
    final firestoreInstance = FirebaseFirestore.instance;
    try {
      var value = await FirebaseAuth.instance.currentUser;
      CandleDataModel candleDataModel = new CandleDataModel();
      candleDataModel.upgrade = upgradedAccount;

      firestoreInstance
          .collection("users")
          .doc(value.uid)
          .get()
          .then((userData) {
        if (userData.data != null) {
          candleDataModel = CandleDataModel.fromJson(userData.data());
          if (deseased != null) {
            for (int i = 0; i < candleDataModel.deseased.length; i++) {
              if (candleDataModel.deseased[i].deceasedName ==
                      deseased.deceasedName &&
                  candleDataModel.deseased[i].deceasedMessage ==
                      deseased.deceasedMessage &&
                  candleDataModel.deseased[i].deceasedDate ==
                      deseased.deceasedDate &&
                  candleDataModel.deseased[i].candleType ==
                      deseased.candleType) {
                candleDataModel.deseased.removeAt(i);
                break;
              }
            }
          }
          deceasedInvites.forEach((element) async {
            final Email email = Email(
              body: 'Message for User',
              subject: 'Subject for users ' + element.deceasedName,
              recipients: [element.deceasedEmail],
              attachmentPaths: ['/path/to/attachment.zip'],
              isHTML: false,
            );
            await FlutterEmailSender.send(email);
          });
          candleDataModel.deseased.add(new Deseased(
              userId: value.uid,
              deceasedName: deceasedName,
              deceasedDate: deceasedTime,
              deceasedMessage: deceasedMessage,
              candleType: type,
              remindByEmail: true,
              remindByPhone: true,
              candleId: candleId,
              deceasedMusic: deceasedMusic,
              deceasedPhoto: deceasedPhoto,
              deceasedInvites: deceasedInvites,
              userName: value.displayName,
              candleLighted: deseased != null ? deseased.candleLighted : null,
              beforeSunset: beforeSunset,
              deceasedfiles: deseased != null ? deseased.deceasedfiles : null,
              isTraditionalCalander: isTraditionalCalander));
          firestoreInstance
              .collection("users")
              .doc(value.uid)
              .set(jsonDecode(jsonEncode(candleDataModel)))
              .then((_) {
            // firestoreInstance.collection("allcandles").document(value.uid).get().then((userData) {
            //
            //   firestoreInstance.collection("users").document(value.uid).set(
            //       jsonDecode(jsonEncode(candleDataModel))
            //   ).then((_){
            //   });
            //
            // });
            Get.to(HomePage(), binding: CandleBindings());
          });
        } else {
          List<Deseased> dead = [];
          dead.add(new Deseased(
            userId: value.uid,
            deceasedName: deceasedName,
            deceasedDate: deceasedTime,
            deceasedMessage: deceasedMessage,
            candleType: type,
            remindByEmail: true,
            remindByPhone: true,
            candleId: candleId,
            deceasedMusic: deceasedMusic,
            isTraditionalCalander: isTraditionalCalander,
            deceasedPhoto: deceasedPhoto,
            deceasedInvites: deceasedInvites,
            userName: value.displayName,
          ));
          candleDataModel.deseased = dead;
          firestoreInstance
              .collection("users")
              .doc(value.uid)
              .set(jsonDecode(jsonEncode(candleDataModel)))
              .then((_) {
            Get.to(HomePage(), binding: CandleBindings());
          });
        }
      });
    } catch (error) {
      print(error.code + "eeeeee");
    }
  }

  void deleteData(Deseased deseased) async {
    final firestoreInstance = FirebaseFirestore.instance;
    try {
      var value = await FirebaseAuth.instance.currentUser;
      CandleDataModel candleDataModel = new CandleDataModel();
      candleDataModel.upgrade = upgradedAccount;
      firestoreInstance
          .collection("users")
          .doc(value.uid)
          .get()
          .then((userData) {
        if (userData.data != null) {
          candleDataModel = CandleDataModel.fromJson(userData.data());
          if (deseased != null) {
            for (int i = 0; i < candleDataModel.deseased.length; i++) {
              if (candleDataModel.deseased[i].deceasedName ==
                      deseased.deceasedName &&
                  candleDataModel.deseased[i].deceasedMessage ==
                      deseased.deceasedMessage &&
                  candleDataModel.deseased[i].deceasedDate ==
                      deseased.deceasedDate &&
                  candleDataModel.deseased[i].candleType ==
                      deseased.candleType) {
                candleDataModel.deseased.removeAt(i);
                break;
              }
            }
          }

          firestoreInstance
              .collection("users")
              .doc(value.uid)
              .set(jsonDecode(jsonEncode(candleDataModel)))
              .then((_) {
            Get.to(HomePage(), binding: CandleBindings());
          });
        }
      });
    } catch (error) {
      print(error.code + "eeeeee");
    }
  }

  void deleteAccount() async {
    final firestoreInstance = FirebaseFirestore.instance;
    try {
      var value = await FirebaseAuth.instance.currentUser;
      CandleDataModel candleDataModel = new CandleDataModel();
      candleDataModel.upgrade = upgradedAccount;
      firestoreInstance.collection("users").doc(value.uid).delete();

      var user = await FirebaseAuth.instance.currentUser;
      user.delete();
      Get.to(LoginPage(), binding: AuthBindings());
    } catch (error) {
      print(error.code + "eeeeee");
    }
  }

  Future<CandleDataModel> getAllCandles() async {
    final firestoreInstance = FirebaseFirestore.instance;
    try {
      CandleDataModel candleDataModel;
      firebaseUser = await FirebaseAuth.instance.currentUser;

      dynamic userData = await firestoreInstance
          .collection("users")
          .doc(firebaseUser.uid)
          .get();

      if (userData.data == null) {
        upgradedAccount = false;
      } else {
        if (candleDataModel.upgrade == null) {
          upgradedAccount = false;
        } else {
          upgradedAccount = candleDataModel.upgrade;
        }
        candleDataModel = CandleDataModel.fromJson(userData.data);
      }
      return candleDataModel;
    } catch (error) {
      print(error.toString() + "eeeeee");
      //  upgradedAccount=false;
    }
  }

  Future<CandleDataModel> getUsersCandles() async {
    final firestoreInstance = FirebaseFirestore.instance;
    try {
      CandleDataModel candleDataModel = new CandleDataModel();
      var value = await FirebaseAuth.instance.currentUser;

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("users").get();
      List<CandleDataModel> candleDataModelList = [];
      List<Deseased> deseased = [];
      bool upgrade = false;
      querySnapshot.docs.forEach((element) {
        candleDataModelList.add(CandleDataModel.fromJson(element.data()));
      });
      //   candleDataModel=  CandleDataModel.fromJson(querySnapshot.documents[0].data);
      candleDataModelList.forEach((element) {
        upgrade = element.upgrade;
        element.deseased.forEach((element) {
          deseased.add(element);
        });
      });
      candleDataModel.deseased = deseased;
      candleDataModel.upgrade = upgrade;

      return candleDataModel;
    } catch (error) {
      print(error.code + "eeeeee");
    }
  }

  upgradeData() async {
    final firestoreInstance = FirebaseFirestore.instance;
    try {
      CandleDataModel candleDataModel;
      var value = await FirebaseAuth.instance.currentUser;

      DocumentSnapshot userData =
          await firestoreInstance.collection("users").doc(value.uid).get();
      candleDataModel = CandleDataModel.fromJson(userData.data());
      upgradedAccount = true;
      candleDataModel.upgrade = true;
      firestoreInstance
          .collection("users")
          .doc(value.uid)
          .set(jsonDecode(jsonEncode(candleDataModel)))
          .then((_) {
        Get.to(HomePage(), binding: CandleBindings());
      });
    } catch (error) {
      print(error.toString() + "eeeeee");
    }
  }

  Future<HerbrewDate> dateConverter(
      String year, String month, String day) async {
    try {
      final _getDate =
          'https://www.hebcal.com/converter?cfg=json&gy=$year&gm=$month&gd=$day&g2h=1';
      final response = await _http.get(Uri.parse(_getDate));
      HerbrewDate candleDataModel =
          HerbrewDate.fromJson(jsonDecode(response.body));
      return candleDataModel;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<AnniversaryDate> annivercaryConverter(
      String year, String month, String day) async {
    try {
      final _getDate =
          "https://www.hebcal.com/yahrzeit?cfg=json&y1=$year&m1=$month&d1=$day&s1=" +
              (beforeSunset ? "on" : "off") +
              "&t1=Anniversary&hebdate=on";
      final response = await _http.get(Uri.parse(_getDate));
      AnniversaryDate candleDataModel =
          AnniversaryDate.fromJson(jsonDecode(response.body));
      return candleDataModel;
    } catch (e) {
      print(e.toString());
    }
  }

  updateGet() async {
    update();
  }

  showDialogue(context) {
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

  void setError(dynamic error) {
    SnackBar(content: Text(error.toString()));
  }

  Future<void> _initSquarePayment() async {
    await InAppPayments.setSquareApplicationId(squareApplicationId);

    var canUseApplePay = false;
    var canUseGooglePay = false;

    await InAppPayments.initializeGooglePay(
        squareLocationId, google_pay_constants.environmentTest);
    canUseGooglePay = await InAppPayments.canUseGooglePay;
  }

  Future<String> makePayment() async {
    _initSquarePayment();
    await _onStartGiftCardEntryFlow();
    // upgradeData();
  }

  void _onCardEntryComplete() {
    upgradeData();
  }

  void _onCardEntryCardNonceRequestSuccess(result) async {
    InAppPayments.completeCardEntry(onCardEntryComplete: _onCardEntryComplete);
  }

  Future<void> _onStartGiftCardEntryFlow() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {}

  void lightCanldle(String type, Deseased deseased) async {
    final firestoreInstance = FirebaseFirestore.instance;
    try {
      var value = await FirebaseAuth.instance.currentUser;
      CandleDataModel candleDataModel = new CandleDataModel();
      candleDataModel.upgrade = upgradedAccount;

      firestoreInstance
          .collection("users")
          .doc(value.uid)
          .get()
          .then((userData) {
        if (userData.data != null) {
          candleDataModel = CandleDataModel.fromJson(userData.data());
          if (deseased != null) {
            for (int i = 0; i < candleDataModel.deseased.length; i++) {
              if (candleDataModel.deseased[i].deceasedName ==
                      deseased.deceasedName &&
                  candleDataModel.deseased[i].deceasedMessage ==
                      deseased.deceasedMessage &&
                  candleDataModel.deseased[i].deceasedDate ==
                      deseased.deceasedDate &&
                  candleDataModel.deseased[i].candleType ==
                      deseased.candleType) {
                candleDataModel.deseased.removeAt(i);
                break;
              }
            }
          }

          candleDataModel.deseased.add(new Deseased(
              userId: value.uid,
              deceasedName: deseased.deceasedName,
              deceasedDate: deseased.deceasedDate,
              deceasedMessage: deseased.deceasedMessage,
              candleType: type,
              isTraditionalCalander: isTraditionalCalander,
              beforeSunset: beforeSunset,
              remindByEmail: true,
              remindByPhone: true,
              candleId: deseased.candleId,
              deceasedMusic: deseased.deceasedMusic,
              deceasedPhoto: deseased.deceasedPhoto,
              deceasedInvites: deseased.deceasedInvites,
              userName: value.displayName,
              candleLighted: true,
              deceasedfiles: deseased.deceasedfiles));
          firestoreInstance
              .collection("users")
              .doc(value.uid)
              .set(jsonDecode(jsonEncode(candleDataModel)))
              .then((_) {});
        }
      });
    } catch (error) {
      print(error.code + "eeeeee");
    }
  }

  void addFilesInCanldle(String type, Deseased deseased, String fileUrl) async {
    final firestoreInstance = FirebaseFirestore.instance;
    try {
      var value = await FirebaseAuth.instance.currentUser;
      CandleDataModel candleDataModel = new CandleDataModel();
      candleDataModel.upgrade = upgradedAccount;
      firestoreInstance
          .collection("users")
          .doc(value.uid)
          .get()
          .then((userData) {
        if (userData.data != null) {
          candleDataModel = CandleDataModel.fromJson(userData.data());
          if (deseased != null) {
            for (int i = 0; i < candleDataModel.deseased.length; i++) {
              if (candleDataModel.deseased[i].deceasedName ==
                      deseased.deceasedName &&
                  candleDataModel.deseased[i].deceasedMessage ==
                      deseased.deceasedMessage &&
                  candleDataModel.deseased[i].deceasedDate ==
                      deseased.deceasedDate &&
                  candleDataModel.deseased[i].candleType ==
                      deseased.candleType) {
                candleDataModel.deseased.removeAt(i);
                break;
              }
            }
          }
          //  deseased.deceasedfiles.add(fileUrl);
          candleDataModel.deseased.add(new Deseased(
              userId: value.uid,
              deceasedName: deseased.deceasedName,
              deceasedDate: deseased.deceasedDate,
              deceasedMessage: deseased.deceasedMessage,
              candleType: type,
              isTraditionalCalander: isTraditionalCalander,
              beforeSunset: beforeSunset,
              remindByEmail: true,
              remindByPhone: true,
              candleId: deseased.candleId,
              deceasedMusic: deseased.deceasedMusic,
              deceasedPhoto: deseased.deceasedPhoto,
              deceasedInvites: deseased.deceasedInvites,
              userName: value.displayName,
              candleLighted: deseased != null ? deseased.candleLighted : null,
              deceasedfiles: deseased.deceasedfiles));
          firestoreInstance
              .collection("users")
              .doc(value.uid)
              .set(jsonDecode(jsonEncode(candleDataModel)))
              .then((_) {});
        }
      });
      update();
    } catch (error) {
      print(error.code + "eeeeee");
    }
  }
}

class HerbrewDate {
  int gy;
  int gm;
  int gd;
  bool afterSunset;
  int hy;
  String hm;
  int hd;
  String hebrew;
  List<String> events;

  HerbrewDate(
      {this.gy,
      this.gm,
      this.gd,
      this.afterSunset,
      this.hy,
      this.hm,
      this.hd,
      this.hebrew,
      this.events});

  HerbrewDate.fromJson(Map<String, dynamic> json) {
    gy = json['gy'];
    gm = json['gm'];
    gd = json['gd'];
    afterSunset = json['afterSunset'];
    hy = json['hy'];
    hm = json['hm'];
    hd = json['hd'];
    hebrew = json['hebrew'];
    events = json['events'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gy'] = this.gy;
    data['gm'] = this.gm;
    data['gd'] = this.gd;
    data['afterSunset'] = this.afterSunset;
    data['hy'] = this.hy;
    data['hm'] = this.hm;
    data['hd'] = this.hd;
    data['hebrew'] = this.hebrew;
    data['events'] = this.events;
    return data;
  }
}

class AnniversaryDate {
  String title;
  String date;
  List<Items> items;

  AnniversaryDate({this.title, this.date, this.items});

  AnniversaryDate.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String title;
  String date;
  String memo;

  Items({this.title, this.date, this.memo});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    memo = json['memo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['memo'] = this.memo;
    return data;
  }
}
