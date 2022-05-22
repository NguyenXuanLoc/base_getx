// To parse this JSON data, do
//
//     final DoctorResponse = DoctorResponseFromJson(jsonString);

import 'dart:convert';

List<DoctorResponse> DoctorResponseFromJson(List<dynamic> list) =>
    List<DoctorResponse>.from(list.map((x) => DoctorResponse.fromJson(x)));

String DoctorResponseToJson(List<DoctorResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class DoctorResponse {
  DoctorResponse({
    this.providerIds,
    this.addresses,
    this.cities,
    this.doctorPriorStartTime,
    this.locationIds,
    this.created,
    this.doctorPriorEndTime,
    this.doctorPriorLevel,
    this.doctorCategory,
    this.doctorRateAvg,
    this.onlineAddresses,
    this.doctorId,
    this.doctorRateCount,
    this.enableOnline,
    this.modified,
    this.id,
    this.doctorName,
    this.doctorProfile,
  });

  List<dynamic>? providerIds;
  List<Address>? addresses;
  List<String>? cities;
  int? doctorPriorStartTime;
  List<int>? locationIds;
  int? created;
  int? doctorPriorEndTime;
  int? doctorPriorLevel;
  String? doctorCategory;
  double? doctorRateAvg;
  List<dynamic>? onlineAddresses;
  int? doctorId;
  int? doctorRateCount;
  bool? enableOnline;
  int? modified;
  int? id;
  String? doctorName;
  DoctorProfile? doctorProfile;

  factory DoctorResponse.fromJson(Map<String, dynamic> json) => DoctorResponse(
    providerIds: List<dynamic>.from(json["provider_ids"].map((x) => x)),
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
    cities: List<String>.from(json["cities"].map((x) => x)),
    doctorPriorStartTime: json["doctor_prior_start_time"],
    locationIds: List<int>.from(json["location_ids"].map((x) => x)),
    created: json["created"],
    doctorPriorEndTime: json["doctor_prior_end_time"],
    doctorPriorLevel: json["doctor_prior_level"],
    doctorCategory: json["doctor_category"],
    doctorRateAvg: json["doctor_rate_avg"],
    onlineAddresses: List<dynamic>.from(json["online_addresses"].map((x) => x)),
    doctorId: json["doctor_id"],
    doctorRateCount: json["doctor_rate_count"],
    enableOnline: json["enable_online"],
    modified: json["modified"],
    id: json["id"],
    doctorName: json["doctor_name"],
    doctorProfile: DoctorProfile.fromJson(json["doctor_profile"]),
  );

  Map<String, dynamic> toJson() => {
    "provider_ids": List<dynamic>.from(providerIds!.map((x) => x)),
    "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "cities": List<dynamic>.from(cities!.map((x) => x)),
    "doctor_prior_start_time": doctorPriorStartTime,
    "location_ids": List<dynamic>.from(locationIds!.map((x) => x)),
    "created": created,
    "doctor_prior_end_time": doctorPriorEndTime,
    "doctor_prior_level": doctorPriorLevel,
    "doctor_category": doctorCategory,
    "doctor_rate_avg": doctorRateAvg,
    "online_addresses": List<dynamic>.from(onlineAddresses!.map((x) => x)),
    "doctor_id": doctorId,
    "doctor_rate_count": doctorRateCount,
    "enable_online": enableOnline,
    "modified": modified,
    "id": id,
    "doctor_name": doctorName,
    "doctor_profile": doctorProfile!.toJson(),
  };
}

class Address {
  Address({
    this.apartmentNumber,
    this.city,
    this.street,
    this.district,
    this.providerId,
    this.services,
    this.locationId,
  });

  String? apartmentNumber;
  String? city;
  String? street;
  String? district;
  int? providerId;
  List<Service>? services;
  int? locationId;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    apartmentNumber: json["apartment_number"],
    city: json["city"],
    street: json["street"],
    district: json["district"],
    providerId: json["provider_id"],
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    locationId: json["location_id"],
  );

  Map<String, dynamic> toJson() => {
    "apartment_number": apartmentNumber,
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
    this.treated,
    this.website,
    this.gender,
    this.facebook,
    this.birthDate,
    this.about,
    this.video,
    this.avatar,
    this.accountId,
    this.emailAccount,
    this.phone,
    this.specialization,
    this.id,
    this.email,
    this.instagram,
  });

  String? treated;
  String? website;
  dynamic? gender;
  String? facebook;
  dynamic birthDate;
  String? about;
  String? video;
  String? avatar;
  int? accountId;
  String? emailAccount;
  String? phone;
  String? specialization;
  int? id;
  String? email;
  String? instagram;

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => DoctorProfile(
    treated: json["treated"],
    website: json["website"],
    gender: json["gender"],
    facebook: json["facebook"],
    birthDate: json["birth_date"],
    about: json["about"],
    video: json["video"],
    avatar: json["avatar"],
    accountId: json["account_id"],
    emailAccount: json["email_account"],
    phone: json["phone"],
    specialization: json["specialization"],
    id: json["id"],
    email: json["email"],
    instagram: json["instagram"] == null ? null : json["instagram"],
  );

  Map<String, dynamic> toJson() => {
    "treated": treated,
    "website": website,
    "gender": gender,
    "facebook": facebook,
    "birth_date": birthDate,
    "about": about,
    "video": video,
    "avatar": avatar,
    "account_id": accountId,
    "email_account": emailAccount,
    "phone": phone,
    "specialization": specialization,
    "id": id,
    "email": email,
    "instagram": instagram == null ? null : instagram,
  };
}

class Meta {
  Meta({
    this.code,
    this.message,
    this.dbMessage,
  });

  int? code;
  String? message;
  String? dbMessage;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    code: json["code"],
    message: json["message"],
    dbMessage: json["db_message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "db_message": dbMessage,
  };
}
