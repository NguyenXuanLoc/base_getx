import 'package:docsify/data/model/test2.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart';

@JsonSerializable(/*explicitToJson: true*/)
class Person {
  @JsonKey(name: 'first_name', defaultValue: "ngu")
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;

  final Student student;

  Person(
      {required this.student, required this.firstName, required this.lastName});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  Person copyWith({String? firstName, String? lastName, Student? student}) {
    return Person(
        student: student ?? this.student,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }
}
