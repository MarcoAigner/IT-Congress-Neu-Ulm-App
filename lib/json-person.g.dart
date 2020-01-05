// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json-person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonPerson _$JsonPersonFromJson(Map<String, dynamic> json) {
  return JsonPerson(
    json['name'] as String,
    json['age'] as String,
    json['gender'] as String,
  );
}

Map<String, dynamic> _$JsonPersonToJson(JsonPerson instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
    };
