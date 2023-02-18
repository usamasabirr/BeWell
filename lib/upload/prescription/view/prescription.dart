import 'dart:io';

import 'package:be_well/upload/prescription/controller/prescription_controller.dart';
import 'package:be_well/upload/prescription/view/file_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

class Prescription extends StatefulWidget {
  const Prescription({super.key});

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  FileViewController? fileViewController;
  PrescriptionController prescriptionController =
      Get.put(PrescriptionController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prescriptionController.getFiles();
  }

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          prescriptionController.pickFile();
        }),
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
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
            Text(
              'Prescription',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Opacity(opacity: 0.0, child: Icon(Icons.arrow_back))
          ]),
        ),
        Obx(
          () => Expanded(
            child: ListView.builder(
                itemCount: prescriptionController.savedPrescriptions.length,
                itemBuilder: ((context, index) {
                  String extension = prescriptionController
                      .savedPrescriptions[index].extension;
                  String name =
                      prescriptionController.savedPrescriptions[index].name;
                  return PrescriptionTile(
                    mediaHeight: mediaHeight,
                    mediaWidth: mediaWidth,
                    prescriptionController: prescriptionController,
                    fileViewController: fileViewController,
                    index: index,
                  );
                })),
          ),
        )
      ])),
    );
  }
}

class PrescriptionTile extends StatelessWidget {
  PrescriptionTile(
      {Key? key,
      required this.mediaHeight,
      required this.mediaWidth,
      required this.prescriptionController,
      required this.fileViewController,
      required this.index})
      : super(key: key);

  final double mediaHeight;
  final double mediaWidth;
  final PrescriptionController prescriptionController;
  var fileViewController;
  final int index;

  @override
  Widget build(BuildContext context) {
    String extension =
        prescriptionController.savedPrescriptions[index].extension;
    String name = prescriptionController.savedPrescriptions[index].name;
    String path = prescriptionController.savedPrescriptions[index].path;
    return InkWell(
      onTap: () async {
        String url = 'file:$path';
        await OpenFilex.open(path);
        // if (await canLaunch(url)) {
        //   await launch(url);
        // } else {
        //   throw 'Could not launch $url';
        // }
        // const url = 'https://blog.logrocket.com';
        // if (await canLaunch(url)) {
        //   await launch(
        //     url,
        //   ); //forceWebView is true now
        // } else {
        //   throw 'Could not launch $url';
        // }
        // fileViewController = FileViewController.file(File(path));
        // Get.to(FileViewPage(controller: fileViewController));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: mediaHeight * 0.1,
        width: mediaWidth,
        child: Column(children: [
          Row(children: [
            Expanded(
              flex: 1,
              child: extension == 'jpeg'
                  ? Image.file(
                      File(path),
                      fit: BoxFit.fill,
                      height: 50,
                      width: 50,
                    )
                  : Icon(
                      Icons.article,
                      size: 50,
                    ),
            ),
            SizedBox(
              width: mediaWidth * 0.03,
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '22 Nov 2021',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      // Text('2.83 Mb')
                    ],
                  ),
                ],
              ),
            )
          ]),
          Divider(
            color: Colors.grey,
            thickness: 1,
          )
        ]),
      ),
    );
  }
}
