class ProfileModel {
  int? statusCode;
  ProfileData? data;
  String? message;

  ProfileModel({this.statusCode, this.data, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"];
    data = json["data"] != null ? ProfileData.fromJson(json["data"]) : null;
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status_code"] = statusCode;
    if (this.data != null) {
      data["data"] = this.data!.toJson();
    }
    data["message"] = message;
    return data;
  }
}

class ProfileData {
  String? id;
  String? blokId;
  String? residenceId;
  String? duesId;
  String? enteredAt;
  String? noResidence;
  String? name;
  String? email;
  String? phone;
  bool? isPublishPhone;
  String? role;
  String? photoUrl;
  String? job;
  bool? isPublishJob;
  String? noKtp;
  String? photoKtpUrl;
  String? noKk;
  String? photoKkUrl;
  String? birthPlace;
  String? birthDate;
  String? religion;
  String? gender;
  Metadata? metadata;
  List<Residence>? residences;

  ProfileData({
    this.id,
    this.blokId,
    this.residenceId,
    this.duesId,
    this.enteredAt,
    this.noResidence,
    this.name,
    this.email,
    this.phone,
    this.isPublishPhone,
    this.role,
    this.photoUrl,
    this.job,
    this.isPublishJob,
    this.noKtp,
    this.photoKtpUrl,
    this.noKk,
    this.photoKkUrl,
    this.birthPlace,
    this.birthDate,
    this.religion,
    this.gender,
    this.metadata,
    this.residences,
  });

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    blokId = json["blok_id"];
    residenceId = json["residence_id"];
    duesId = json["dues_id"];
    enteredAt = json["entered_at"];
    noResidence = json["no_residence"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    isPublishPhone = json["is_publish_phone"];
    role = json["role"];
    photoUrl = json["photo_url"];
    job = json["job"];
    isPublishJob = json["is_publish_job"];
    noKtp = json["no_ktp"];
    photoKtpUrl = json["photo_ktp_url"];
    noKk = json["no_kk"];
    photoKkUrl = json["photo_kk_url"];
    birthPlace = json["birth_place"];
    birthDate = json["birth_date"];
    religion = json["religion"];
    gender = json["gender"];
    metadata =
        json["metadata"] != null ? Metadata.fromJson(json["metadata"]) : null;
    residences = json["residences"] == null
        ? []
        : List<Residence>.from(
            json["residences"]!.map((x) => Residence.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["blok_id"] = blokId;
    data["residence_id"] = residenceId;
    data["dues_id"] = duesId;
    data["entered_at"] = enteredAt;
    data["no_residence"] = noResidence;
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["is_publish_phone"] = isPublishPhone;
    data["role"] = role;
    data["photo_url"] = photoUrl;
    data["job"] = job;
    data["is_publish_job"] = isPublishJob;
    data["no_ktp"] = noKtp;
    data["photo_ktp_url"] = photoKtpUrl;
    data["no_kk"] = noKk;
    data["photo_kk_url"] = photoKkUrl;
    data["birth_place"] = birthPlace;
    data["birth_date"] = birthDate;
    data["religion"] = religion;
    data["gender"] = gender;
    if (metadata != null) {
      data["metadata"] = metadata!.toJson();
    }
    data["residences"] = residences == null
        ? []
        : List<dynamic>.from(residences!.map((x) => x.toJson()));
    return data;
  }
}

class Metadata {
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  String? author;
  String? modifier;

  Metadata(
      {this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.author,
      this.modifier});

  Metadata.fromJson(Map<String, dynamic> json) {
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    updatedBy = json["updated_by"];
    author = json["author"];
    modifier = json["modifier"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["created_by"] = createdBy;
    data["updated_by"] = updatedBy;
    data["author"] = author;
    data["modifier"] = modifier;
    return data;
  }
}

class Residence {
  final String? id;
  final String? noResidence;
  final String? houseNumber;

  Residence({
    this.id,
    this.noResidence,
    this.houseNumber,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
        id: json["id"],
        noResidence: json["no_residence"],
        houseNumber: json["house_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_residence": noResidence,
        "house_number": houseNumber,
      };
}
