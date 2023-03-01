import 'package:hive/hive.dart';

part 'document_model.g.dart';

@HiveType(typeId: 5)
class DocumentModel {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String path;
  @HiveField(2)
  late String extension;
  @HiveField(3)
  late String id;

  DocumentModel(
      {required this.name,
      required this.path,
      required this.extension,
      required this.id});

  DocumentModel.empty() {
    name = '';
    path = '';
    extension = '';
    id = '';
  }
}
