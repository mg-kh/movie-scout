import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/cast/cast_image/profiles.dart';

part 'cast_image.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CastImage {
  late int? id;
  late List<Profiles>? profiles;

  CastImage({required this.id, required this.profiles});

  factory CastImage.fromJson(Map<String, dynamic> json) =>
      _$CastImageFromJson(json);

  Map<String, dynamic> toJson() => _$CastImageToJson(this);
}
