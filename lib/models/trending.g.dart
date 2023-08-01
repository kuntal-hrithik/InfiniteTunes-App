// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trending _$TrendingFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Trending',
      json,
      ($checkedConvert) {
        final val = Trending(
          songs: $checkedConvert(
              'songs',
              (v) => (v as List<dynamic>)
                  .map((e) => Song.fromJson(e as Map<String, dynamic>))
                  .toList()),
          albums: $checkedConvert(
              'albums',
              (v) => (v as List<dynamic>)
                  .map((e) => Album.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TrendingToJson(Trending instance) => <String, dynamic>{
      'songs': instance.songs.map((e) => e.toJson()).toList(),
      'albums': instance.albums.map((e) => e.toJson()).toList(),
    };
