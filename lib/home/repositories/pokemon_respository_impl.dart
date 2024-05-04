import 'dart:convert';

import 'package:pokedex/core/config/config.dart';
import 'package:pokedex/home/domain/pokemon.dart';
import 'package:http/http.dart' as http;

import 'pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  @override
  Future<List<Pokemon>> fetch(String url) async {
    var url = Uri.https(Config.baseUrl);
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final pokemonList =
          (jsonDecode(response.body) as Map<String, Map<String, dynamic>>)
              .values
              .map<Pokemon>((value) => Pokemon.fromJson(value))
              .toList();
      return pokemonList;
    } else {
      throw Exception();
    }
  }
}
