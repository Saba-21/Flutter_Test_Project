// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterListResponse _$CharacterListResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterListResponse(
      Info.fromJson(json['info'] as Map<String, dynamic>),
      (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterListResponseToJson(
        CharacterListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'info': instance.info,
    };
