import 'package:json_annotation/json_annotation.dart';

part 'profiles.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Profiles {
  late double? aspectRatio;
  late int? height;
  late String? iso_639_1;
  late String? filePath;
  late double? voteAverage;
  late int? voteCount;
  late int? width;

  Profiles({
    required this.aspectRatio,
    required this.height,
    required this.iso_639_1,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Profiles.fromJson(Map<String, dynamic> json) =>
      _$ProfilesFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilesToJson(this);
}
