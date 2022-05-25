// To parse this JSON data, do
//
//     final cityResponse = cityResponseFromJson(jsonString);

import 'dart:convert';

List<CityResponse> cityResponseFromJson(List<dynamic> list) =>
    List<CityResponse>.from(list.map((x) => CityResponse.fromJson(x)));

String cityResponseToJson(List<CityResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityResponse {
  CityResponse({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
