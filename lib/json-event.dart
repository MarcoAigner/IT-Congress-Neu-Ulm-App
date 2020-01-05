import 'package:json_annotation/json_annotation.dart';
import 'json-lecture.dart';
part 'json-event.g.dart';

@JsonSerializable(explicitToJson: true)
class JsonEvent {
  String time;
  List<JsonLecture> lectures;

  JsonEvent({this.time, this.lectures});

  factory JsonEvent.fromJson(Map<String, dynamic> json) => _$JsonEventFromJson(json);
  Map<String, dynamic> toJson() => _$JsonEventToJson(this);
}
