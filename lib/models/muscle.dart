import 'package:json_annotation/json_annotation.dart';

part 'muscle.g.dart';

@JsonSerializable(nullable: false)
class Muscle {
  final String name;

  Muscle({this.name});

  @override
  String toString() => name;

  factory Muscle.fromJson(Map<String, dynamic> json) => _$MuscleFromJson(json);
  Map<String, dynamic> toJson() => _$MuscleToJson(this);
}
