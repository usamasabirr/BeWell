import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
            'About Us',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: mediaHeight * 0.5,
            width: mediaWidth * 0.9,
            color: Colors.grey[300],
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'BeWell application was inspired \n\nto help in emergencies cases \n\nand to let the users maintain \n\ntheir health.',
                style: TextStyle(fontSize: 23, color: Color(0xff494747)),
              ),
              SizedBox(
                height: 40,
              ),
              Row(children: [
                Text(
                  'We are here to help you...',
                  style: TextStyle(fontSize: 23, color: Color(0xff494747)),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.blue,
                )
              ]),
            ]),
          )
        ]),
      ),
    );
  }
}
