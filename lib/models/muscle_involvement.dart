import 'package:json_annotation/json_annotation.dart';
import 'package:pixel_fit/models/muscle.dart';

part 'muscle_involvement.g.dart';

@JsonSerializable(nullable: false)
class MuscleInvolvement {
  final Muscle muscle;
  final int weight;

  MuscleInvolvement({this.muscle, this.weight});

  @override
  String toString() => "$muscle $weight";
  factory MuscleInvolvement.fromJson(Map<String, dynamic> json) =>
      _$MuscleInvolvementFromJson(json);
  Map<String, dynamic> toJson() => _$MuscleInvolvementToJson(this);
}
