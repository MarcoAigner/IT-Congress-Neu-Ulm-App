import 'package:json_annotation/json_annotation.dart';
part 'json-lecture.g.dart';

@JsonSerializable(explicitToJson: true)
class JsonLecture {
  String title;
  List<String> lecturers;
  String category;
  String description;

  JsonLecture({this.title, this.lecturers, this.category, this.description});

  factory JsonLecture.fromJson(Map<String, dynamic> json) => _$JsonLectureFromJson(json);
  Map<String, dynamic> toJson() => _$JsonLectureToJson(this);
}
