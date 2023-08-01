// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Playlist',
      json,
      ($checkedConvert) {
        final val = Playlist(
          id: $checkedConvert('id', (v) => v as String?),
          userId: $checkedConvert('userId', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          subtitle: $checkedConvert('subtitle', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          image: $checkedConvert(
              'image',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => DownloadUrl.fromJson(e as Map<String, dynamic>))
                  .toList()),
          url: $checkedConvert('url', (v) => v as String?),
          songCount: $checkedConvert('songCount', (v) => v as String?),
          firstname: $checkedConvert('firstname', (v) => v as String?),
          followerCount: $checkedConvert('followerCount', (v) => v as String?),
          lastUpdated: $checkedConvert('lastUpdated', (v) => v as String?),
          explicitContent:
              $checkedConvert('explicitContent', (v) => v as String?),
          songs: $checkedConvert(
              'songs',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': instance.type,
      'image': instance.image?.map((e) => e.toJson()).toList(),
      'url': instance.url,
      'songCount': instance.songCount,
      'firstname': instance.firstname,
      'followerCount': instance.followerCount,
      'lastUpdated': instance.lastUpdated,
      'explicitContent': instance.explicitContent,
      'songs': instance.songs?.map((e) => e.toJson()).toList(),
    };
