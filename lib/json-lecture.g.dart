// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json-lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonLecture _$JsonLectureFromJson(Map<String, dynamic> json) {
  return JsonLecture(
    title: json['title'] as String,
    lecturers: (json['lecturers'] as List)?.map((e) => e as String)?.toList(),
    category: json['category'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$JsonLectureToJson(JsonLecture instance) =>
    <String, dynamic>{
      'title': instance.title,
      'lecturers': instance.lecturers,
      'category': instance.category,
      'description': instance.description,
    };
