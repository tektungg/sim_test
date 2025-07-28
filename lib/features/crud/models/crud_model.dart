import 'package:hive/hive.dart';

part 'crud_model.g.dart'; // penting untuk generated file

@HiveType(typeId: 0)
class CrudModel {
  @HiveField(0)
  List<CrudDataModel>? data;

  CrudModel({this.data});

  CrudModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      data = <CrudDataModel>[];
      json["data"].forEach((v) {
        data!.add(CrudDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class CrudDataModel extends HiveObject {
  @HiveField(0)
  DateTime? createdAt;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? address;

  @HiveField(3)
  String? phone;

  @HiveField(4)
  DateTime? updatedAt;

  @HiveField(5)
  String? id;

  CrudDataModel({
    this.createdAt,
    this.name,
    this.address,
    this.phone,
    this.updatedAt,
    this.id,
  });

  factory CrudDataModel.fromJson(Map<String, dynamic> json) => CrudDataModel(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "name": name,
        "address": address,
        "phone": phone,
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
      };
}
