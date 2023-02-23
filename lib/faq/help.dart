import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          //app bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: mediaHeight * 0.1,
            width: mediaWidth,
            child: Row(children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back)),
              Expanded(
                child: SizedBox(),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Opacity(opacity: 0.0, child: Icon(Icons.arrow_back))
            ]),
          ),
          //image
          Container(
            color: Colors.green,
            height: mediaHeight * 0.14,
            width: mediaWidth * 0.9,
            child: Stack(children: [
              Container(
                width: mediaWidth * 0.9,
                height: mediaHeight * 0.14,
                child: Image.asset(
                  'assets/images/blue.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: mediaHeight * 0.02,
                child: Container(
                  height: mediaHeight * 0.1,
                  child: Image.asset(
                    'assets/images/logo_only.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Be Well",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Help',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: mediaHeight * 0.5,
            width: mediaWidth * 0.9,
            color: Colors.grey[300],
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpansionTile(
                      title: Text('How Can I Update My QR Code?'),
                      children: [
                        Text(
                            'You can edit your profile by opening the profile page, after that click the “Edit” button at the top of the page.')
                      ],
                    ),
                    ExpansionTile(
                      title: Text('How can I reset my password?'),
                      children: [
                        Text(
                            'You can reset your password by opening the login page, then clicking on the “forget your password” button at the bottom, after that, enter your email correctly, so that the code will be sent to you as confirmation.')
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                          'Is it possible to delete the document? And how? '),
                      children: [
                        Text(
                            'Yes, it is possible, you can easily delete your unwanted document by clicking the garbage icon next to the unwanted document. ')
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                          'Will the QR code be updated after the modifications of your profile?'),
                      children: [
                        Text(
                            'Yes, after you modify the profile, the QR code will be updated after you press the “generate QR code” button.')
                      ],
                    ),
                    ExpansionTile(
                      title: Text('How do I delete an alarm?'),
                      children: [
                        Text(
                            'You can delete your unwanted alarm by clicking on the garbage icon next to the alarm that you desire to delete.')
                      ],
                    ),
                    ExpansionTile(
                      title: Text('How can I download the QR code?'),
                      children: [
                        Text(
                            'After you click the “generate QR code” button, a new button will appear which is the “save image” button, you can through it download your QR code as a picture in your mobile gallery.')
                      ],
                    ),
                    ExpansionTile(
                      title: Text('How can I view the prescription?'),
                      children: [
                        Text(
                            'After downloading any prescription on the app, you can easily view it by clicking on the prescription you want to view.')
                      ],
                    ),
                    ExpansionTile(
                      title: Text('How can I log out of the app?'),
                      children: [
                        Text(
                            'You can log out from your profile by opening the profile page, after that click the “log out” button at the end of your profile page.')
                      ],
                    ),
                    ExpansionTile(
                      title: Text('How can I track my menstrual cycle?'),
                      children: [
                        Text(
                            'Our female users can simply track their menstrual cycle in our period feature, you can enter your previous period date and how many days between each period “period cycle”, then the app will predict your next period when it starts.')
                      ],
                    ),
                    ExpansionTile(
                      title: Text('HHow can I delete my profile?'),
                      children: [
                        Text(
                            'You can delete your profile from the app, by opening the profile page, after that click the “delete account” button at the end of your profile page.')
                      ],
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
