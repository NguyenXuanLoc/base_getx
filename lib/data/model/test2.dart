import 'package:json_annotation/json_annotation.dart';

part 'test2.g.dart';

@JsonSerializable()
class Student {
  @JsonKey(name: 'age_')
  final int age;

  Student({required this.age});

  factory Student.fromJson(Map<String, dynamic> json) =>_$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
