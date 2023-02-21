import 'dart:io';

import 'package:be_well/upload/prescription/model/prescription_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../reminder/medicineReminder/model/medicine_reminder_model.dart';

class PrescriptionController extends GetxController {
  var prescriptionBox = Hive.box<PrescriptionModel>('Prescription');
  RxList savedPrescriptions = [].obs;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    // print('appdocPath is $appDocPath');
    if (result != null) {
      File file = File(result.files.single.path as String);

      String name = file.path.split('/').last;
      String extension = file.path.split('.').last;
      var copied = await file.copy(appDocPath + '/${name}');
      var uuid = Uuid();
      var key = uuid.v1();
      PrescriptionModel prescription = PrescriptionModel(
          name: name, path: copied.path, extension: extension, id: key);
      print('fileName is $name');
      print('extension is $extension');

      //save prescription

      await prescriptionBox.put(key, prescription);
      savedPrescriptions.add(prescription);
      // print('original file path is ${file.path}');
      // print('copied file path is ${copied.path}');
    } else {
      // User canceled the picker
    }
  }

  deleteSavedPrescription(int index) async {
    print('inside');
    //prescriptionBox.clear();
    await prescriptionBox.delete(savedPrescriptions[index].id).then((value) {
      savedPrescriptions.remove(savedPrescriptions[index]);
    });
  }

  getFiles() async {
    prescriptionBox.values.forEach((element) {
      savedPrescriptions.add(element);
    });
  }
}
