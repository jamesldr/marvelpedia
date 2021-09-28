import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:marvelpedia/app/models/character_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../secret.dart';
import 'models/comic_model.dart';

part 'repository.g.dart';

String ts = DateTime.now().millisecondsSinceEpoch.toString();
String publicKey = '868ae7a37cab7c8f5e1689fad98a8c97';

@RestApi(baseUrl: 'http://gateway.marvel.com/v1/public/')
abstract class Repository {
  factory Repository(Dio dio, {String baseUrl}) = _Repository;

  @GET('/characters')
  Future<CharacterWrapperModel> getCharacters(
    @Queries() Map<String, dynamic> params,
  );

  @GET('/characters/{id}/comics')
  Future<ComicWrapperModel> getCharacterComics(
    @Path() int id,
    @Queries() Map<String, dynamic> params,
  );
}
