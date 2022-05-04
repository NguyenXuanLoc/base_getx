// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      student: Student.fromJson(json['student'] as Map<String, dynamic>),
      firstName: json['first_name'] as String? ?? 'ngu',
      lastName: json['last_name'] as String,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'student': instance.student.toJson(),
    };
