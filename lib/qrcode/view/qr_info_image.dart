import 'package:be_well/qrcode/controller/qrcode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class QrInfoImage extends StatefulWidget {
  const QrInfoImage({super.key});

  @override
  State<QrInfoImage> createState() => _QrInfoImageState();
}

class _QrInfoImageState extends State<QrInfoImage> {
  QrCodeController qrCodeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: mediaHeight,
        width: mediaWidth,
        decoration: BoxDecoration(
            color: Colors.green,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background.png'))),
        child: Column(
          children: [
            //Appbar
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(children: [
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Text(
                  "QR Code",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                SizedBox(
                  width: 15,
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            WidgetsToImage(
              controller: qrCodeController.infoToImageController,
              child: Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    height: mediaHeight * 0.8,
                    width: mediaWidth,
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    top: mediaHeight * 0.06,
                    child: Container(
                        height: mediaHeight * 0.7,
                        width: mediaWidth,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          //color: Colors.orange,
                          margin: EdgeInsets.only(
                              top: mediaHeight * 0.12 - mediaHeight * 0.06,
                              left: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Usama Bin Sabir',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Date Of Birth',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '14-10-2000',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Blood Type',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'O-',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Allergies',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Eggs, cats, mango',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Diseases',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Asthma',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Weight (Kg)',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '60 (kg)',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Height (cm)',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '165 (cm)',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Gender',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Friend Name',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Usama Bin Sabir',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Friend or Family Number',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '(+966)566676889',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Doctor Name',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Usama Bin Sabir',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Doctor Number',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '(+966)566676889',
                                  style: TextStyle(
                                      color: Color(0xff161455),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Positioned(
                    left: (mediaWidth / 2) - ((mediaHeight * 0.12) / 2),
                    child: Container(
                      height: mediaHeight * 0.12,
                      width: mediaHeight * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/female_vector.png'))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaHeight * 0.06,
              width: mediaWidth * 0.67,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color(0xff7FD958)),
                  onPressed: () {
                    qrCodeController.generateQrCode();
                  },
                  child: Text("Finish")),
            )
          ],
        ),
      )),
    );
  }
}
