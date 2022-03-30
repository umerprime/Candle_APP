import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:get/get.dart';
import 'package:candle/viewmodels/candle_data_model.dart';


class PersonalMessage extends StatefulWidget {
  Deseased deseased;
  String type;
  PersonalMessage(this.deseased,this.type);
  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<PersonalMessage> {
  TextEditingController messageController = TextEditingController();
  final notifier = Get.find<CandleViewModel>();
  @override
  void initState() {

    if(widget.deseased==null){
      notifier.updateData=false;
    }else{
      notifier.updateData=true;
      messageController.text=widget.deseased.deceasedMessage;
    }
  }

  @override
  Widget build(BuildContext context) {

    return
      Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.10,
        width: MediaQuery.of(context).size.width*1,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(widget.type=="jewish"? "assets/images/CandleTypes/bg_yarzhiet.png":
            widget.type=="general"?"assets/images/CandleTypes/bg_generic.png":"assets/images/CandleTypes/bg_catholic.png"),
            fit: BoxFit.fill,
          ),
          //color: Colors.green,
        ),
        child: Center(
          child: InkWell(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0,0),
              child: AutoSizeTextField(
                controller: messageController,
                fullwidth: true,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (text) {
                 notifier.deceasedMessage=text;
                },
                minFontSize: 16.0,
                style: TextStyle(
                    fontSize: 18.0,
                    height: 1.5,
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '  PERSONAL MESSAGE (50 CHARACTERS)',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  //icon: new Icon(Icons.lock,size: 18.0,),
                ),
              ),
            ),
          ),
        ),
      );



  }}

