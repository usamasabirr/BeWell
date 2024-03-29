import 'package:hive/hive.dart';

part 'prescription_model.g.dart';

@HiveType(typeId: 4)
class PrescriptionModel {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String path;
  @HiveField(2)
  late String extension;
  @HiveField(3)
  late String id;

  PrescriptionModel(
      {required this.name,
      required this.path,
      required this.extension,
      required this.id});

  PrescriptionModel.empty() {
    name = '';
    path = '';
    extension = '';
    id = '';
  }
}
