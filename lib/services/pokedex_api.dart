import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon_app/model/pokemon_model.dart';

class PokeApi {
  static const String url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];
    var result = await Dio().get(url);
    var pokemonList = jsonDecode(result.data)['pokemon'];

    if (pokemonList is List) {
      _list = pokemonList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return _list;
  }
}
