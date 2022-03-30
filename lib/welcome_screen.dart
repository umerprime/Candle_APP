import 'package:candle/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'annimation.dart';
import 'bindings.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: main(),
        builder: (context, snapshot) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF212121),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipPath(
                                clipper: WaveClipperTwo(),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFFf99321),
                                        Color(0xFFfc5a3b),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Container(
                            width: MediaQuery.of(context).size.width - 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: FadeAnimation(
                                  1.6,
                                  Text(
                                    'Welcome to virtual \nmemory candle',
                                    style: TextStyle(
                                        color: Color(0xFFcccccf),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 33),
                                  )),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: FadeAnimation(
                                  1.6,
                                  Text(
                                    'Virtual Memory Candles will forever remind you by\n email or text of the upcoming anniversary of a\n deceased loved one and on the actual anniversary, a\n virtual memory candle will stay lit on your phone for 24 hours,\n commemorating the passing of a loved one. ',
                                    style: TextStyle(
                                        color: Color(0xFF777779),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )),
                            ),
                          ),
                          SizedBox(height: 120),
                          GestureDetector(
                            onTap: () {
                              Get.to(HomePage(), binding: CandleBindings());
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: FadeAnimation(
                                  1.6,
                                  Container(
                                      height: 50,
                                      width: 320,

                                      // margin: EdgeInsets.symmetric(horizontal: 50),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFffb421),
                                          Color(0xFFff7521)
                                        ]),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(HomePage(),
                                              binding: CandleBindings());
                                        },
                                        child: Center(
                                          child: Text(
                                            "Goto Home",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ))),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  Future main() async {
    String username = 'umerfarooq2k20@gmail.com';
    String password = '04237597867Flutter';

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Your name')
      ..recipients.add('umerfarooqsaeed7@gmail.com')
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    // DONE

    // Let's send another message using a slightly different syntax:
    //
    // Addresses without a name part can be set directly.
    // For instance `..recipients.add('destination@example.com')`
    // If you want to display a name part you have to create an
    // Address object: `new Address('destination@example.com', 'Display name part')`
    // Creating and adding an Address object without a name part
    // `new Address('destination@example.com')` is equivalent to
    // adding the mail address as `String`.
    final equivalentMessage = Message()
      ..from = Address(username, 'Your name 😀')
      ..recipients.add(Address('destination@example.com'))
      ..ccRecipients
          .addAll([Address('destCc1@example.com'), 'destCc2@example.com'])
      ..bccRecipients.add('bccAddress@example.com')
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          '<h1>Test</h1>\n<p>Hey! Here is some HTML content</p><img src="cid:myimg@3.141"/>';

    final sendReport2 = await send(equivalentMessage, smtpServer);

    // Sending multiple messages with the same connection
    //
    // Create a smtp client that will persist the connection
    var connection = PersistentConnection(smtpServer);

    // Send the first message
    await connection.send(message);

    // send the equivalent message
    await connection.send(equivalentMessage);

    // close the connection
    await connection.close();
  }

  @override
  void initState() {}
}
