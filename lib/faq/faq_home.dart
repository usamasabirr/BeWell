import 'package:be_well/faq/about_us.dart';
import 'package:be_well/faq/help.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FaqHome extends StatefulWidget {
  const FaqHome({super.key});

  @override
  State<FaqHome> createState() => _FaqHomeState();
}

class _FaqHomeState extends State<FaqHome> {
  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
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
          //buttons
          SizedBox(
            height: mediaHeight * 0.15,
          ),
          InkWell(
            onTap: () {
              Get.to(Help());
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: mediaHeight * 0.06,
              width: mediaWidth * 0.8,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/question.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Help'),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          InkWell(
            onTap: () {
              Get.to(AboutUs());
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: mediaHeight * 0.06,
              width: mediaWidth * 0.8,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/exclamation.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('About us'),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
