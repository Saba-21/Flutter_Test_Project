import 'package:sample_app/data_models/character.dart';
import 'package:sample_app/data_models/info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class CharacterListResponse {
  final List<Character> results;
  final Info info;

  CharacterListResponse(this.info, this.results);

  factory CharacterListResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterListResponseToJson(this);
}
