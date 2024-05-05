import 'dart:convert';

import 'package:pokedex/core/config/config.dart';
import 'package:pokedex/home/domain/pokemon_detail_item.dart';
import 'package:pokedex/home/domain/pokemon_item.dart';
import 'package:http/http.dart' as http;

import 'pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  @override
  Future<List<PokemonDetailItem>> fetch() async {
    var url = Uri.parse(Config.baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['results'];
      final List<PokemonItem> pokemonItemList = results
          .map<PokemonItem>((value) => PokemonItem.fromJson(value))
          .toList();
      List<PokemonDetailItem> pokemonDetailList = [];
      for (var pokemonItem in pokemonItemList) {
        var urlDetail = Uri.parse(pokemonItem.url);
        var responseItem = await http.get(urlDetail);
        if (response.statusCode == 200) {
          final result = jsonDecode(responseItem.body);
          pokemonDetailList.add(PokemonDetailItem.fromJson(result));
        } else {
          throw Exception();
        }
      }
      return pokemonDetailList;
    } else {
      throw Exception();
    }
  }
}
