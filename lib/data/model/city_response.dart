// To parse this JSON data, do
//
//     final cityResponse = cityResponseFromJson(jsonString);

import 'dart:convert';

List<CityResponse> cityResponseFromJson(List<dynamic> str) =>
    List<CityResponse>.from(str.map((x) => CityResponse.fromJson(x)));

String cityResponseToJson(List<CityResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityResponse {
  CityResponse({
    this.city,
    this.province,
    this.area,
    this.population,
  });

  String? city;
  String? province;
  String? area;
  String? population;

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        city: json["city"],
        province: json["province"],
        area: json["area"],
        population: json["population"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "province": province,
        "area": area,
        "population": population,
      };
}
