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
    this.index,
    this.type,
    this.id,
    this.score,
    this.source,
    this.sort,
  });

  String? index;
  String? type;
  String? id;
  dynamic? score;
  Source? source;
  List<double>? sort;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        index: json["_index"],
        type: json["_type"],
        id: json["_id"],
        score: json["_score"],
        source: Source.fromJson(json["_source"]),
        sort: List<double>.from(
            json["sort"].map((x) => double.parse(x.toString()))),
      );

  Map<String, dynamic> toJson() => {
        "_index": index,
        "_type": type,
        "_id": id,
        "_score": score,
        "_source": source?.toJson(),
        "sort": List<dynamic>.from(sort!.map((x) => x)),
      };
}

class Source {
  Source({
    this.op,
    this.before,
    this.after,
    this.source,
    this.tsMs,
    this.transaction,
  });

  String? op;
  dynamic before;
  After? after;
  SourceClass? source;
  int? tsMs;
  dynamic transaction;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        op: json["op"],
        before: json["before"],
        after: After.fromJson(json["after"]),
        source: SourceClass.fromJson(json["source"]),
        tsMs: json["ts_ms"],
        transaction: json["transaction"],
      );

  Map<String, dynamic> toJson() => {
        "op": op,
        "before": before,
        "after": after?.toJson(),
        "source": source?.toJson(),
        "ts_ms": tsMs,
        "transaction": transaction,
      };
}

class After {
  After({
    this.providerIds,
    this.addresses,
    this.cities,
    this.locationIds,
    this.created,
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
  List<int>? locationIds;
  int? created;
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

  factory After.fromJson(Map<String, dynamic> json) => After(
        providerIds: List<dynamic>.from(json["provider_ids"].map((x) => x)),
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
        cities: List<String>.from(json["cities"].map((x) => x)),
        locationIds: List<int>.from(json["location_ids"].map((x) => x)),
        created: json["created"],
        doctorPriorLevel: json["doctor_prior_level"],
        doctorCategory: json["doctor_category"],
        doctorRateAvg: json["doctor_rate_avg"],
        onlineAddresses:
            List<dynamic>.from(json["online_addresses"].map((x) => x)),
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
        "location_ids": List<dynamic>.from(locationIds!.map((x) => x)),
        "created": created,
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
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
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
  });

  String? treated;
  String? website;
  dynamic gender;
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
      };
}

class SourceClass {
  SourceClass({
    this.schema,
    this.xmin,
    this.connector,
    this.lsn,
    this.name,
    this.txId,
    this.version,
    this.tsMs,
    this.snapshot,
    this.db,
    this.table,
  });

  String? schema;
  dynamic xmin;
  String? connector;
  int? lsn;
  String? name;
  int? txId;
  String? version;
  int? tsMs;
  String? snapshot;
  String? db;
  String? table;

  factory SourceClass.fromJson(Map<String, dynamic> json) => SourceClass(
        schema: json["schema"],
        xmin: json["xmin"],
        connector: json["connector"],
        lsn: json["lsn"],
        name: json["name"],
        txId: json["txId"],
        version: json["version"],
        tsMs: json["ts_ms"],
        snapshot: json["snapshot"],
        db: json["db"],
        table: json["table"],
      );

  Map<String, dynamic> toJson() => {
        "schema": schema,
        "xmin": xmin,
        "connector": connector,
        "lsn": lsn,
        "name": name,
        "txId": txId,
        "version": version,
        "ts_ms": tsMs,
        "snapshot": snapshot,
        "db": db,
        "table": table,
      };
}
