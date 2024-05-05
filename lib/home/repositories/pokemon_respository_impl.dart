import 'dart:convert';

import 'package:pokedex/core/config/config.dart';
import 'package:pokedex/home/domain/pokemon.dart';
import 'package:http/http.dart' as http;

import 'pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  @override
  Future<List<Pokemon>> fetch() async {
    var url = Uri.parse(Config.baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['results'];
      final pokemonList =
          results.map<Pokemon>((value) => Pokemon.fromJson(value)).toList();
      return pokemonList;
    } else {
      throw Exception();
    }
  }
}
