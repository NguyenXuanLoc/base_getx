// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

List<SearchResponse> searchResponseFromJson(List<dynamic> list) =>
    List<SearchResponse>.from(list.map((x) => SearchResponse.fromJson(x)));

String searchResponseToJson(List<SearchResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResponse {
  SearchResponse({
    this.source,
  });

  Source? source;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        source: Source.fromJson(json["_source"]),
      );

  Map<String, dynamic> toJson() => {
        "_source": source?.toJson(),
      };
}

class Source {
  Source({this.after});

  After? after;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        after: After.fromJson(json["after"]),
      );

  Map<String, dynamic> toJson() => {
        "after": after?.toJson(),
      };
}

class After {
  After({
    this.addresses,
    this.doctorRateAvg,
    this.onlineAddresses,
    this.doctorId,
    this.doctorRateCount,
    this.enableOnline,
    this.id,
    this.doctorName,
    this.doctorProfile,
  });

  List<Address>? addresses;
  double? doctorRateAvg;
  List<dynamic>? onlineAddresses;
  int? doctorId;
  int? doctorRateCount;
  bool? enableOnline;
  int? id;
  String? doctorName;
  DoctorProfile? doctorProfile;

  factory After.fromJson(Map<String, dynamic> json) => After(
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
        doctorRateAvg: json["doctor_rate_avg"],
        onlineAddresses:
            List<dynamic>.from(json["online_addresses"].map((x) => x)),
        doctorId: json["doctor_id"],
        doctorRateCount: json["doctor_rate_count"],
        enableOnline: json["enable_online"],
        id: json["id"],
        doctorName: json["doctor_name"],
        doctorProfile: DoctorProfile.fromJson(json["doctor_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "doctor_rate_avg": doctorRateAvg,
        "online_addresses": List<dynamic>.from(onlineAddresses!.map((x) => x)),
        "doctor_id": doctorId,
        "doctor_rate_count": doctorRateCount,
        "enable_online": enableOnline,
        "id": id,
        "doctor_name": doctorName,
        "doctor_profile": doctorProfile!.toJson(),
      };
}

class Address {
  Address({
    this.city,
    this.street,
    this.district,
    this.providerId,
    this.services,
    this.locationId,
  });

  String? city;
  String? street;
  String? district;
  int? providerId;
  List<Service>? services;
  int? locationId;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        street: json["street"],
        district: json["district"],
        providerId: json["provider_id"],
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        locationId: json["location_id"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "district": district,
        "provider_id": providerId,
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
        "location_id": locationId,
      };
}

class Service {
  Service({
    this.serviceName,
    this.price,
    this.providerServiceId,
    this.providerServiceDescription,
    this.currencyUnit,
  });

  String? serviceName;
  int? price;
  int? providerServiceId;
  String? providerServiceDescription;
  String? currencyUnit;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceName: json["service_name"],
        price: json["price"],
        providerServiceId: json["provider_service_id"],
        providerServiceDescription: json["provider_service_description"],
        currencyUnit: json["currency_unit"],
      );

  Map<String, dynamic> toJson() => {
        "service_name": serviceName,
        "price": price,
        "provider_service_id": providerServiceId,
        "provider_service_description": providerServiceDescription,
        "currency_unit": currencyUnit,
      };
}

class DoctorProfile {
  DoctorProfile({
    this.gender,
    this.birthDate,
    this.about,
    this.avatar,
    this.accountId,
    this.emailAccount,
    this.phone,
    this.specialization,
    this.id,
    this.email,
  });

  dynamic gender;
  dynamic birthDate;
  String? about;
  String? avatar;
  int? accountId;
  String? emailAccount;
  String? phone;
  String? specialization;
  int? id;
  String? email;

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => DoctorProfile(
        gender: json["gender"],
        birthDate: json["birth_date"],
        about: json["about"],
        avatar: json["avatar"],
        accountId: json["account_id"],
        emailAccount: json["email_account"],
        phone: json["phone"],
        specialization: json["specialization"],
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "birth_date": birthDate,
        "about": about,
        "avatar": avatar,
        "account_id": accountId,
        "email_account": emailAccount,
        "phone": phone,
        "specialization": specialization,
        "id": id,
        "email": email,
      };
}
