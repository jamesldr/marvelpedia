// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$charactersAtom = Atom(name: 'HomeStoreBase.characters');

  @override
  ObservableList<CharacterModel> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<CharacterModel> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$comicsAtom = Atom(name: 'HomeStoreBase.comics');

  @override
  ObservableList<ComicModel> get comics {
    _$comicsAtom.reportRead();
    return super.comics;
  }

  @override
  set comics(ObservableList<ComicModel> value) {
    _$comicsAtom.reportWrite(value, super.comics, () {
      super.comics = value;
    });
  }

  final _$offsetIncrementAtom = Atom(name: 'HomeStoreBase.offsetIncrement');

  @override
  int? get offsetIncrement {
    _$offsetIncrementAtom.reportRead();
    return super.offsetIncrement;
  }

  @override
  set offsetIncrement(int? value) {
    _$offsetIncrementAtom.reportWrite(value, super.offsetIncrement, () {
      super.offsetIncrement = value;
    });
  }

  final _$populateCharactersAsyncAction =
      AsyncAction('HomeStoreBase.populateCharacters');

  @override
  Future populateCharacters() {
    return _$populateCharactersAsyncAction
        .run(() => super.populateCharacters());
  }

  final _$populateMoreCharactersAsyncAction =
      AsyncAction('HomeStoreBase.populateMoreCharacters');

  @override
  Future populateMoreCharacters() {
    return _$populateMoreCharactersAsyncAction
        .run(() => super.populateMoreCharacters());
  }

  @override
  String toString() {
    return '''
characters: ${characters},
comics: ${comics},
offsetIncrement: ${offsetIncrement}
    ''';
  }
}
