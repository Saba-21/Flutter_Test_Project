// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['id'] as int,
      json['name'] as String,
      json['status'] as String,
      json['species'] as String,
      json['type'] as String,
      json['gender'] as String,
      json['image'] as String,
      json['url'] as String,
      json['created'] as String,
      Data.fromJson(json['origin'] as Map<String, dynamic>),
      Data.fromJson(json['location'] as Map<String, dynamic>),
      (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'image': instance.image,
      'url': instance.url,
      'created': instance.created,
      'origin': instance.origin,
      'location': instance.location,
      'episode': instance.episode,
    };
