// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json-event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonEvent _$JsonEventFromJson(Map<String, dynamic> json) {
  return JsonEvent(
    time: json['time'] as String,
    lectures: (json['lectures'] as List)
        ?.map((e) =>
            e == null ? null : JsonLecture.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JsonEventToJson(JsonEvent instance) => <String, dynamic>{
      'time': instance.time,
      'lectures': instance.lectures?.map((e) => e?.toJson())?.toList(),
    };
