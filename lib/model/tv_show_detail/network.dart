import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Network {
  late String? name;
  late int? id;
  late String? logoPath;
  late String? originCountry;

  Network({
    required this.name,
    required this.id,
    required this.logoPath,
    required this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
