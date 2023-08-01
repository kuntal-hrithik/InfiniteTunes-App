// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Module',
      json,
      ($checkedConvert) {
        final val = Module(
          albums: $checkedConvert(
              'albums',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
                  .toList()),
          playlists: $checkedConvert(
              'playlists',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
                  .toList()),
          charts: $checkedConvert(
              'charts',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Chart.fromJson(e as Map<String, dynamic>))
                  .toList()),
          trending: $checkedConvert(
              'trending',
              (v) => v == null
                  ? null
                  : Trending.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'albums': instance.albums?.map((e) => e.toJson()).toList(),
      'playlists': instance.playlists?.map((e) => e.toJson()).toList(),
      'charts': instance.charts?.map((e) => e.toJson()).toList(),
      'trending': instance.trending?.toJson(),
    };
