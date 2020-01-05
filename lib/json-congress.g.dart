// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json-congress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonCongress _$JsonCongressFromJson(Map<String, dynamic> json) {
  return JsonCongress(
    altered: json['altered'] as String,
    events: (json['events'] as List)
        ?.map((e) =>
            e == null ? null : JsonEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JsonCongressToJson(JsonCongress instance) =>
    <String, dynamic>{
      'altered': instance.altered,
      'events': instance.events?.map((e) => e?.toJson())?.toList(),
    };
