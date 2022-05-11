// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.id,
    this.accountId,
    this.emailAccount,
    this.email,
    this.fullName,
    this.gender,
    this.birthDate,
    this.photo,
    this.phone,
    this.zipCode,
    this.place,
    this.district,
    this.description,
    this.lastUpdate,
    this.created,
  });

  int? id;
  int? accountId;
  String? emailAccount;
  dynamic email;
  String? fullName;
  String? gender;
  DateTime? birthDate;
  dynamic photo;
  String? phone;
  String? zipCode;
  String? place;
  dynamic? district;
  String? description;
  DateTime? lastUpdate;
  DateTime? created;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        accountId: json["account_id"],
        emailAccount: json["email_account"],
        email: json["email"],
        fullName: json["full_name"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birth_date"]),
        photo: json["photo"],
        phone: json["phone"],
        zipCode: json["zip_code"],
        place: json["place"],
        district: json["district"],
        description: json["description"],
        lastUpdate: DateTime.parse(json["last_update"]),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "email_account": emailAccount,
        "email": email,
        "full_name": fullName,
        "gender": gender,
        "birth_date": birthDate?.toIso8601String(),
        "photo": photo,
        "phone": phone,
        "zip_code": zipCode,
        "place": place,
        "district": district,
        "description": description,
        "last_update": lastUpdate?.toIso8601String(),
        "created": created?.toIso8601String(),
      };
}
