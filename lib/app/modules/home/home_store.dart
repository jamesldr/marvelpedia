import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelpedia/app/models/character_model.dart';
import 'package:marvelpedia/app/models/comic_model.dart';
import 'package:mobx/mobx.dart';

import '../../../secret.dart';
import '../../repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final Repository repo = Modular.get();
  @observable
  var characters = <CharacterModel>[].asObservable();
  @observable
  var comics = <ComicModel>[].asObservable();
  Map<String, dynamic> params = {
    'ts': '1632784032655',
    'apikey': publicKey,
    'hash': md5
        .convert(
          utf8.encode(
            '1632784032655'
            '$privateKey'
            '$publicKey',
          ),
        )
        .toString()
  };

  gotoHeroDetails(CharacterModel character) async {
    var response = await repo.getCharacterComics(character.id!, params);
    comics = response.data!.results!.asObservable();
    Modular.to.pushNamed('/detalhes', arguments: character);
  }

  @action
  populateCharacters() async {
    var response = await repo.getCharacters(params);
    characters = response.data!.results!.asObservable();

    offsetIncrement = characters.length;
  }

  @observable
  int? offsetIncrement;
  int offset = 0;
  @action
  populateMoreCharacters() async {
    offset += offsetIncrement ?? 0;
    var localParams = {...params, 'offset': offset};
    var response = await repo.getCharacters(localParams);

    characters = <CharacterModel>[
      ...characters.toList(),
      ...response.data!.results!
    ].asObservable();
  }
}
