
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:intl/intl.dart';
import 'package:candle/viewmodels/candle_view_model.dart';
import 'package:get/get.dart';

class UpgradeCalendar extends StatefulWidget {
  Deseased deseased;

  @override
  _welcomeJewishPageState createState() => _welcomeJewishPageState();

  UpgradeCalendar(this.deseased);
}

class _welcomeJewishPageState extends State<UpgradeCalendar> {
   String formatted;
   String formattedNext;
   final notifier = Get.find<CandleViewModel>();
   HerbrewDate herbrewDate;
   AnniversaryDate anniDate;
   String datee;
  @override
  void initState() {
    var inputFormat = DateFormat('MM/dd/yyyy');
    notifier.beforeSunset=widget.deseased.beforeSunset;
    DateTime date1 = inputFormat.parse(widget.deseased.deceasedDate);
    getHerbrewDate(date1);
    getAnnivarDate(date1);

    var outputFormat = DateFormat('MMM d, ''yyy');
    var date2 = outputFormat.format(date1); // 2019-08-18
    var now = new DateTime.now();
    var datenext;
    if(now.month<=date1.month){
       datenext = new DateTime(now.year, date1.month, date1.day);
    }else{
       datenext = new DateTime(now.year+1, date1.month, date1.day);
    }

    var date2next = outputFormat.format(datenext); // 2019-08-18

    formattedNext=date2next;
    formatted=date2;// something like 2013-04-20
    if(widget.deseased.candleType!= "jewish") {
      if (datenext.month == now.month&&datenext.day==now.day&&datenext.year==now.year) {
        notifier.todayIsAnnivarcary = true;
      } else {
        notifier.todayIsAnnivarcary = false;
      }

      notifier.updateGet();
    }
  }
  @override
  Widget build(BuildContext context) {
    return
      Container(
      height:  widget.deseased.candleType== "jewish"?MediaQuery
          .of(context)
          .size
          .height * 0.20:MediaQuery
          .of(context)
          .size
          .height * 0.14,
      width: MediaQuery.of(context).size.width*1,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(widget.deseased.candleType=="jewish"? "assets/images/CandleTypes/bg_yarzhiet.png":
          widget.deseased.candleType=="general"?"assets/images/CandleTypes/bg_generic.png":"assets/images/CandleTypes/bg_catholic.png"),
          fit: BoxFit.fill,
        ),
        //color: Colors.green,
      ),

      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                Image(image: new AssetImage( "assets/images/_Common/Icons/calander.png",
                ),height: 60,width: 60,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Date of Deceased:',
                            style: GoogleFonts.zillaSlab(
                              textStyle: TextStyle(
                                  fontSize: 15*
                                      MediaQuery.textScaleFactorOf(
                                          context),
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white
                              ),

                            )),



                        Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                          child: Text(formatted,
                              style: GoogleFonts.zillaSlab(
                                textStyle: TextStyle(
                                    fontSize: 15*
                                        MediaQuery.textScaleFactorOf(
                                            context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),

                              )),
                        )
                      ],
                    ),




                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,5,0,0),
                          child: Text((widget.deseased.candleType=="jewish"&&!widget.deseased.isTraditionalCalander)?'Hebrew Date: ':'Next Candle Date:',
                              style: GoogleFonts.zillaSlab(
                                textStyle: TextStyle(
                                    fontSize: 15*
                                        MediaQuery.textScaleFactorOf(
                                            context),
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white
                                ),

                              )),
                        ),



                        (widget.deseased.candleType=="jewish"&&!widget.deseased.isTraditionalCalander)?   Padding(
                          padding: const EdgeInsets.fromLTRB(5,5,0,0),
                          child: Text(herbrewDate!=null?herbrewDate.hd.toString()+" "+herbrewDate.hm+", "+herbrewDate.hy.toString():"-- ---, --",
                              style: GoogleFonts.zillaSlab(
                                textStyle: TextStyle(
                                    fontSize: 15*
                                        MediaQuery.textScaleFactorOf(
                                            context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),

                              )),
                        ):   Padding(
                          padding: const EdgeInsets.fromLTRB(5,5,0,0),
                          child: Text(formattedNext,
                              style: GoogleFonts.zillaSlab(
                                textStyle: TextStyle(
                                    fontSize: 15*
                                        MediaQuery.textScaleFactorOf(
                                            context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),

                              )),
                        ),
                      ],
                    ),





                    (widget.deseased.candleType=="jewish"&&!widget.deseased.isTraditionalCalander)?    Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,5,0,0),
                          child: Text('Next Yahrzeit: ',
                              style: GoogleFonts.zillaSlab(
                                textStyle: TextStyle(
                                    fontSize: 15*
                                        MediaQuery.textScaleFactorOf(
                                            context),
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white
                                ),

                              )),
                        ),





                        Padding(
                          padding: const EdgeInsets.fromLTRB(5,5,0,0),
                          child: Text(anniDate!=null?datee:"-- ---, --",
                              style: GoogleFonts.zillaSlab(
                                textStyle: TextStyle(
                                    fontSize: 15*
                                        MediaQuery.textScaleFactorOf(
                                            context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),

                              )),
                        ),
                      ],
                    ):Container(),


                  ],
                ),


              ],
            ),
          ),





        ],
      ),

    );




  }
getHerbrewDate(DateTime date1)async{
  herbrewDate= await notifier.dateConverter(date1.year.toString(), date1.month.toString(), date1.day.toString());
setState(() {

});
}
   getAnnivarDate(DateTime date1)async{

     date1 = new DateTime(date1.year, date1.month , date1.day);
     anniDate= await notifier.annivercaryConverter(date1.year.toString(), date1.month.toString(), date1.day.toString());

     // String str = anniDate.items[0].memo;
     // const start = "to the ";
     // const end = ".\n\nPerson1's";
     //
     // final startIndex = str.indexOf(start);
     // final endIndex = str.indexOf(end, startIndex + start.length);
     //
     // datee=str.substring(startIndex + start.length, endIndex);
     var str = anniDate.items[0].date;
     // var newStr = str.substring(0,10) + ' ' + str.substring(11,23);
     // print(newStr);
     // DateTime dt = DateTime.parse(newStr);
     // print(DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt));
     //
     //
     var outputFormat = DateFormat('MMM d, ''yyy');
     DateTime dt1 = DateTime.parse(str);
     var dateee = outputFormat.format(dt1);
     datee=dateee;
     DateTime dt = DateTime.parse(str);
     final now = DateTime.now();
     final today = DateTime(now.year, now.month, now.day);
     final aDate = DateTime(dt.year, dt.month, dt.day);
     if(widget.deseased.candleType== "jewish") {
       if(widget.deseased.isTraditionalCalander){
         var datenext;
         if(now.month<=date1.month){
           datenext = new DateTime(now.year, date1.month, date1.day);
         }else{
           datenext = new DateTime(now.year+1, date1.month, date1.day);
         }
         if (datenext.month == now.month&&datenext.day==now.day&&datenext.year==now.year) {
           notifier.todayIsAnnivarcary = true;
         } else {
           notifier.todayIsAnnivarcary = false;
         }

       }else{
         if (aDate.month == today.month&&aDate.day==today.day&&aDate.year==today.year) {
           notifier.todayIsAnnivarcary = true;
         } else {
           notifier.todayIsAnnivarcary = false;
         }
       }

       notifier.updateGet();
     }
     setState(() {

     });
   }
}