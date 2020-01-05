import 'package:json_annotation/json_annotation.dart';
part 'json-person.g.dart';

@JsonSerializable(explicitToJson: true)
class JsonPerson {

  String name;
  String age;
  String gender;

  JsonPerson(this.name,this.age,this.gender);

  factory JsonPerson.fromJson(Map<String, dynamic> json) => _$JsonPersonFromJson(json);
  Map<String, dynamic> toJson() => _$JsonPersonToJson(this);

}
