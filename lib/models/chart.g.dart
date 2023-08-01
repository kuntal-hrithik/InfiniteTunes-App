// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chart _$ChartFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Chart',
      json,
      ($checkedConvert) {
        final val = Chart(
          id: $checkedConvert('id', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          subtitle: $checkedConvert('subtitle', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          image: $checkedConvert(
              'image',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => DownloadUrl.fromJson(e as Map<String, dynamic>))
                  .toList()),
          url: $checkedConvert('url', (v) => v as String?),
          firstname: $checkedConvert('firstname', (v) => v as String?),
          explicitContent:
              $checkedConvert('explicitContent', (v) => v as String?),
          language: $checkedConvert('language', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ChartToJson(Chart instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': instance.type,
      'image': instance.image?.map((e) => e.toJson()).toList(),
      'url': instance.url,
      'firstname': instance.firstname,
      'explicitContent': instance.explicitContent,
      'language': instance.language,
    };
