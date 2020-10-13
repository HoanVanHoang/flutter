// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return Metadata(
    json['results'] as int,
    json['page'] as int,
    json['version'] as String,
    json['seed'] as String,
  );
}

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'results': instance.results,
      'page': instance.page,
      'version': instance.version,
      'seed': instance.seed,
    };
