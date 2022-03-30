
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:candle/viewmodels/candle_data_model.dart';
import 'package:intl/intl.dart' as init;






class PrayDetail extends StatefulWidget {
  Deseased deseased;
  String language;
  PrayDetail(this.deseased,this.language);
  @override
  _welcomeJewishPageState createState() => _welcomeJewishPageState();
}

class _welcomeJewishPageState extends State<PrayDetail> {
  String formatted;
  @override
  void initState() {
    var inputFormat = init.DateFormat('MM/dd/yyyy');
    DateTime date1 = inputFormat.parse(widget.deseased.deceasedDate);
    var outputFormat = init.DateFormat('MMM d, ''yyy');
    var date2 = outputFormat.format(date1); // 2019-08-18
    formatted=date2;// something
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 1,
          width: MediaQuery
              .of(context)
              .size
              .width * 1,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/_Common/BGs/Bg.jpg"),
                fit: BoxFit.fill,
              )
          ),

          child:Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.17,
                width: MediaQuery.of(context).size.width*1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage(widget.deseased.candleType=="jewish"? "assets/images/CandleTypes/Top_band_Jewish.png":
                      widget.deseased.candleType=="general"?"assets/images/CandleTypes/Top_band_Generic.png":"assets/images/CandleTypes/Top_band_Catholic.png",),
                      fit: BoxFit.fill
                  ),
                  //color: Colors.red
                ),


                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [



                    widget.language!="Disclaimer"?         Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0,0,0),
          child:widget.deseased.deceasedPhoto==null? Image(image: new AssetImage( "assets/images/_Common/Icons/Cir_photo_empty.png",
          ),height: 70,width: 70,):CircleAvatar(
            radius: 40.0,
            backgroundImage:
            NetworkImage(widget.deseased.deceasedPhoto),
            backgroundColor: Colors.transparent,
          ),
        ):Container(),

                    widget.language=="Disclaimer"?   Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20,20,20),
                      child: Image(image: new AssetImage(widget.deseased.candleType=="jewish"? "assets/images/CandleTypes/Jewish_Star.png":
                      widget.deseased.candleType=="general"?"assets/images/CandleTypes/Generic_Candle.png":"assets/images/CandleTypes/Catholic_Cross.png")),
                    ):Container(),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0,0,0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          widget.language!="Disclaimer"? Center(
                            child: Text(widget.deseased.deceasedName,
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18*
                                          MediaQuery.textScaleFactorOf(
                                              context),
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white
                                  ),

                                )),
                          ):Container(),
                          widget.language!="Disclaimer"?  Center(
                            child: Text('Passed Away $formatted',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 18*
                                          MediaQuery.textScaleFactorOf(
                                              context),
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white
                                  ),

                                )),
                          ): Center(
                            child: Text('Disclaimer',
                                style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      fontSize: 30*

                                          MediaQuery.textScaleFactorOf(
                                              context),
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                  ),

                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.020,),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.70,
                width: MediaQuery.of(context).size.width*1,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [



                      widget.language!="Disclaimer"?   Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0,0,0),
                            child: Image(image: new AssetImage( "assets/images/_Common/Icons/Prayer_book.png",
                            ),height: 60,width: 60,),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0,0,0),
                            child: Center(
                              child: Text('Prayers',
                                  style: GoogleFonts.zillaSlab(
                                    textStyle: TextStyle(
                                        fontSize: 20 *
                                            MediaQuery.textScaleFactorOf(
                                                context),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),

                                  )),
                            ),
                          ),

                        ],
                      ):Container(),


                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.010,),
                    widget.language!="Prayer"&&widget.language!="Disclaimer"?      Padding(
                              padding: const EdgeInsets.fromLTRB(80, 0,0,0),
                              child: Center(
                                child: Text(widget.language=="English"?'Exalted and hallowed by Gods great name in the world which God created, according to plan. May Gods majesty be revealed in the days of our lifetime and the life of all Israel – speedily, imminently, to which we say Amen.Blessed be Gods great name to all eternity.':
                                    widget.language=="Hebrew"?"התרומם והתקדש על ידי שם גדול של אלוהים בעולם שאלוהים ברא, לפי התוכנית. יהי רצון שאלוהות תתגלה בימי חיינו וחיי כלל ישראל - במהירות ובקרוב, שאנו אומרים לה אמן ברוך השם הגדול של אלוהים לנצח נצחים.":
                                    "Yitgadal v’yitkadash sh'mei raba. B'alma di v'ra chirutei, v'yamlich malchutei, b'chayeichon uv'yomeichon uv'chayei d'chol beit Yisrael, baagala uviz'man kariv. V'im'ru: Amen" ,
                                    style: GoogleFonts.zillaSlab(
                                      textStyle: TextStyle(
                                          fontSize: 14 *
                                              MediaQuery.textScaleFactorOf(
                                                  context),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),

                                    )),
                              ),):widget.language=="Prayer"?  Padding(
                        padding: const EdgeInsets.fromLTRB(80, 0,0,0),
                        child: Center(
                          child: Text(widget.deseased.candleType=="general"?
                          'A life well lived is a precious gift, \n Of hope and strength and grace, \n From someone who has made our world \n A brighter, better place. \n It’s filled with moments, sweet and sad \n With smiles and sometimes tears, \n With friendships formed and good times shared, \n And laughter through the years. \n A life well lived is a legacy, \n Of joy and pride and pleasure, \n A living, lasting memory \n Our grateful heart’s will treasure.':
                          'O Lord, \n the God of mercies, \n grant unto the souls of Thy servants \n the anniversary day of whose burial \n we are keeping, \n a place of solace, \n of peaceful rest, \n of glorious light. \n\n Through Christ our Lord, \n\n Amen \n ',
                              style: GoogleFonts.zillaSlab(
                                textStyle: TextStyle(
                                    fontSize: 14 *
                                        MediaQuery.textScaleFactorOf(
                                            context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),

                              )),
                        ),):widget.language=="Disclaimer"? Padding(
                        padding: const EdgeInsets.fromLTRB(80, 0,0,0),
                        child: Center(
                          child: Text("Although every effort has been made to provide complete and accurate information, Virtual Memory Candles makes no warranties, expressed or implied, or representations as to the accuracy of content on this site. Virtual Memory Candles assumes no liability or responsibility for any errors or omissions in the information contained herein. By using Virtual Memory Candles, you assume all risks associated with the use of this site including any risk of your computer, software, data or any electronic devices being damaged by a virus, software, or any other files or applications which might be transmitted or activated via our site. Virtual Memory Candles expressly disclaims any liability for any special, incidental or consequential damages including without limitation, lost revenues or lost profits, resulting from the use or misuse of the information contained in the site. This disclaimer of liability also applies to any damages or injury, including buy not limited to those caused by an failure of performance, error, omission, interruption, deletion, defect, delay in operation or transmission, computer virus, communication line failure, theft or destruction or unauthorized access to alteration of, or use of record, whether for breach of contract, tortuous behavior, or negligence or under any other theory or cause of action.",
                              style: GoogleFonts.zillaSlab(
                                textStyle: TextStyle(
                                    fontSize: 14 *
                                        MediaQuery.textScaleFactorOf(
                                            context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),

                              )),
                        ),):Container(),


                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.010,),

                            widget.language!="Prayer"&&widget.language!="Disclaimer"?    Padding(
                                padding: const EdgeInsets.fromLTRB(80, 0,0,0),
                                child: Center(
                                  child: Text(widget.language=="English"?'Blessed, praised, honored, exalted,extolled, glorified, adores, and lauded be the name of the Holy Blessed One, beyond all earthly words and songs of blessing, praise, and comfort. To which we say Amen.':
                                      widget.language=="Hebrew"?"ברוך, שבח, מכובד, מתנשא, מוהל, מהולל, מעריץ ושבחים את שמו של הקדוש ברוך הוא, מעבר לכל המילים הארציות ושירי הברכה, השבח והנחמה. אליו אנו אומרים אמן.":
                                      "Y'hei ch'mei raba m'varach l'alam ul'almei almaya. Yitbarach v'yishtabach v'yitpaar v'yitromam v'yitnasei, V'yithadar v'yitaleh V'yit'halal sh'mei d'Kud'sha B'rich Hu, l'eila min kol birchata v'shirata, tushb'chata V'nechemata, daamiran b'alma. V'imru: \n Amen.",
                                      style: GoogleFonts.zillaSlab(
                                        textStyle: TextStyle(
                                            fontSize: 14 *
                                                MediaQuery.textScaleFactorOf(
                                                    context),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),

                                      )),
                                ),
                              ):Container(),







                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.010,),






                            widget.language!="Prayer"&&widget.language!="Disclaimer"?     Padding(
                                padding: const EdgeInsets.fromLTRB(80, 0,0,0),
                                child: Center(
                                  child: Text(widget.language=="English"?'May there be abundant peace from heaven, and life, for us and all Israel, to which we say Amen.':
                                  widget.language=="Hebrew"?"יהי רצון שיהיה שפע של שמים וחיים, לנו ולכל ישראל, שאנו אומרים לו אמן.":
                                  "Y'hei sh'lama raba min sh'maya, v'chayim aleinu val kol Yisrael. Vimru: Amen.",
                                      style: GoogleFonts.zillaSlab(
                                        textStyle: TextStyle(
                                            fontSize: 14 *
                                                MediaQuery.textScaleFactorOf(
                                                    context),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),

                                      )),
                                ),
                              ):Container(),


                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.010,),


                            widget.language!="Prayer"&&widget.language!="Disclaimer"?      Padding(
                                padding: const EdgeInsets.fromLTRB(80, 0,0,0),
                                child: Center(
                                  child: Directionality(
                                    textDirection: widget.language=="Hebrew"?TextDirection.rtl:TextDirection.ltr,
                                    child: Text(widget.language=="English"?'May the one who creates harmony on high, bring peace to us and to all Israel, To which we say Amen.':
                                    widget.language=="Hebrew"?"מי שיוצר הרמוניה בגובה, יביא שלום לנו ולכל ישראל, שאנו אומרים עליו אמן.":
                                   "Oseh shalom bimromav, Hu yaaseh shalom aleinu, v'al kol Yisrael. V'imru: \n Amen.",
                                        style: GoogleFonts.zillaSlab(
                                          textStyle: TextStyle(
                                              fontSize: 14 *
                                                  MediaQuery.textScaleFactorOf(
                                                      context),
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),

                                        )),
                                  ),
                                ),
                              ):Container(),


                          ],
                        ),
                      ),




                    ],),
                ),


              ),









              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Image(image: new AssetImage( "assets/images/_Common/Icons/Fornt_button.png",
                      ),height: 45,width: 45,),
                    ),
                  ),






                ],
              ),


            ],) ,

        ),
      ),
    );


  }
}