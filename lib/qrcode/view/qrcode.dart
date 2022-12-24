import 'package:be_well/qrcode/controller/qrcode_controller.dart';
import 'package:be_well/qrcode/view/qr_info_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  QrCodeController qrCodeController = Get.put(QrCodeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qrCodeController.checkIfQrCode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete();
    super.dispose();
  }

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
                // InkWell(
                //   onTap: () {
                //     Get.back();
                //   },
                //   child: Icon(
                //     Icons.arrow_back,
                //   ),
                // ),
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
              controller: qrCodeController.widgetsToImageController,
              child: Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    height: mediaHeight * 0.6,
                    width: mediaWidth,
                  ),
                  Positioned(
                    top: mediaHeight * 0.06,
                    child: Container(
                      height: mediaHeight * 0.5,
                      width: mediaWidth,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: FittedBox(
                        child: Obx(
                          () => qrCodeController.showQrCode.value == true
                              ? QrImage(
                                  data:
                                      "https://firebasestorage.googleapis.com/v0/b/bewell-ecf2e.appspot.com/o/Usamabinsabir?alt=media&token=f04a1dd7-af8b-4112-8fe1-2d73bb94d6aa",
                                  version: QrVersions.auto,
                                  size: 70.0,
                                )
                              : SizedBox(),
                        ),
                      ),
                    ),
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
              child: qrCodeController.showQrCode == false
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xff7FD958)),
                      onPressed: () {
                        Get.to(QrInfoImage());
                        //qrCodeController.generateQrCode();
                      },
                      child: Text("Generate Qr Code"))
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xff7FD958)),
                      onPressed: () {
                        qrCodeController.saveQrCodeToGallery();
                        //Get.to(QrInfoImage());
                        //qrCodeController.generateQrCode();
                      },
                      child: Text("Save Image")),
            )
          ],
        ),
      )),
    );
  }
}
