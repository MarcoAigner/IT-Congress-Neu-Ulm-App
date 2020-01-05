import 'package:json_annotation/json_annotation.dart';
import 'json-event.dart';
part 'json-congress.g.dart';

@JsonSerializable(explicitToJson: true)
class JsonCongress {
  String altered;
  List<JsonEvent> events;

  JsonCongress({this.altered, this.events});

  factory JsonCongress.fromJson(Map<String, dynamic> json) => _$JsonCongressFromJson(json);

  Map<String, dynamic> toJson() => _$JsonCongressToJson(this);
}
