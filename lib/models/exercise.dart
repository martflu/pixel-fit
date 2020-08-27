import 'package:json_annotation/json_annotation.dart';

import 'muscle_involvement.dart';

part 'exercise.g.dart';

@JsonSerializable(nullable: false)
class Exercise {
  final String name;
  final List<MuscleInvolvement> muscles;
  final int points;

  Exercise({this.name, this.muscles, this.points});

  @override
  String toString() => "$name $muscles $points";

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
