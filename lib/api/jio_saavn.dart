import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/models.dart';
import '../utils/utils.dart';

final String jioSaavnEndpoint = dotenv.env['JIOSAAVN_ENDPOINT']!;

class JioSaavnApi {
  Future<T> _jioSaavnGetCall<T>(
    String path,
    T Function(dynamic json) fromJsonT,
  ) async {
    final url = '$jioSaavnEndpoint${path.startsWith("/") ? path : "/$path"}';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return TResponse.fromJson(data, fromJsonT).data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Module> getHomeData({List<String>? langs}) async {
    return await _jioSaavnGetCall<Module>(
      '/modules?langs=${langs?.join(",")}',
      (json) => Module.fromJson(json),
    );
  }

  Future<List<Song>> getSongDetails(String query) async {
    return isJioSaavnLink(query)
        ? await _jioSaavnGetCall<List<Song>>(
            '/songs/link=$query',
            (json) =>
                (json as List<dynamic>).map((s) => Song.fromJson(s)).toList(),
          )
        : await _jioSaavnGetCall<List<Song>>(
            '/songs?id=$query',
            (json) =>
                (json as List<dynamic>).map((s) => Song.fromJson(s)).toList(),
          );
  }

  Future<Album> getAlbumDetails(String query) async {
    return isJioSaavnLink(query)
        ? await _jioSaavnGetCall<Album>(
            '/albums/link=$query',
            (json) => Album.fromJson(json),
          )
        : await _jioSaavnGetCall<Album>(
            '/albums?id=$query',
            (json) => Album.fromJson(json),
          );
  }

  Future<Playlist> getPlaylistDetails(String id) async {
    return await _jioSaavnGetCall<Playlist>(
      '/playlists?id=$id',
      (json) => Playlist.fromJson(json),
    );
  }

  Future<Artist> getArtistDetails(String query) async {
    return isJioSaavnLink(query)
        ? await _jioSaavnGetCall<Artist>(
            '/artists/link=$query',
            (json) => Artist.fromJson(json),
          )
        : await _jioSaavnGetCall<Artist>(
            '/artists?id=$query',
            (json) => Artist.fromJson(json),
          );
  }

  Future<TSearchResponse<Song>> getArtistSongs(
    String id, {
    int page = 1,
    String? cat = "latest", // [alphabetical, latest]
    String? sort = "asc", // [asc, desc]
  }) async {
    return await _jioSaavnGetCall<TSearchResponse<Song>>(
      '/artists/$id/songs?page=$page&category=$cat&sort=$sort',
      (json) => TSearchResponse.fromJson(
        json,
        (json) => Song.fromJson(json as Map<String, dynamic>),
      ),
    );
  }

  Future<TSearchResponse<Playlist>> getArtistAlbums(
    String id, {
    int page = 1,
    String? cat = "latest", // [alphabetical, latest]
    String? sort = "asc", // [asc, desc]
  }) async {
    return await _jioSaavnGetCall<TSearchResponse<Playlist>>(
      '/artists/$id/albums?page=$page&category=$cat&sort=$sort',
      (json) => TSearchResponse.fromJson(
        json,
        (json) => Playlist.fromJson(json as Map<String, dynamic>),
      ),
    );
  }

  Future<List<Song>> getArtistRecommendedSongs({
    required String artistId,
    required String songId,
    List<String> langs = const ["hindi", "english"],
    // ["hindi", "english", "punjabi", "tamil", "telugu", "marathi", "gujarati", "bengali", "kannada", "bhojpuri", "malayalam", "urdu", "haryanvi", "rajasthani", "odia", "assamese"]
  }) async {
    return await _jioSaavnGetCall<List<Song>>(
      '/artists/$artistId/recommendations/$songId?language=${langs.join(',')}',
      (json) => (json as List<dynamic>).map((s) => Song.fromJson(s)).toList(),
    );
  }

  // Future<Map<String, dynamic>> searchAll(String query) async {
  //   return await _jioSaavnGetCall<Map<String, dynamic>>(
  //     '/search/all?query=${clearUrl(query)}',
  //   );
  // }

  Future<TSearchResponse<Song>> searchSongs(
    String query, {
    int page = 1,
    int limit = 10,
  }) async {
    return await _jioSaavnGetCall<TSearchResponse<Song>>(
      '/search/songs?query=${clearUrl(query)}&page=$page&limit=$limit',
      (json) => TSearchResponse.fromJson(
        json,
        (json) => Song.fromJson(json as Map<String, dynamic>),
      ),
    );
  }

  Future<TSearchResponse<Album>> searchAlbums(
    String query, {
    int page = 1,
    int limit = 10,
  }) async {
    return await _jioSaavnGetCall<TSearchResponse<Album>>(
      '/search/albums?query=${clearUrl(query)}&page=$page&limit=$limit',
      (json) => TSearchResponse.fromJson(
        json,
        (json) => Album.fromJson(json as Map<String, dynamic>),
      ),
    );
  }

  Future<TSearchResponse<Playlist>> searchPlaylists(
    String query, {
    int page = 1,
    int limit = 10,
  }) async {
    return await _jioSaavnGetCall<TSearchResponse<Playlist>>(
      '/search/playlists?query=${clearUrl(query)}&page=$page&limit=$limit',
      (json) => TSearchResponse.fromJson(
        json,
        (json) => Playlist.fromJson(json as Map<String, dynamic>),
      ),
    );
  }

  Future<TSearchResponse<Artist>> searchArtists(
    String query, {
    int page = 1,
    int limit = 10,
  }) async {
    return await _jioSaavnGetCall<TSearchResponse<Artist>>(
      '/search/artists?query=${clearUrl(query)}&page=$page&limit=$limit',
      (json) => TSearchResponse.fromJson(
        json,
        (json) => Artist.fromJson(json as Map<String, dynamic>),
      ),
    );
  }
}

final api = JioSaavnApi();
