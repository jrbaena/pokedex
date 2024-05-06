import 'dart:convert';

import 'package:pokedex/core/config/config.dart';
import 'package:pokedex/home/domain/pokemon_detail_item.dart';
import 'package:pokedex/home/domain/pokemon_item.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/home/domain/pokemon_list_item.dart';
import 'package:pokedex/home/domain/pokemon_type.dart';

import 'pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  @override
  Future<PokemonListItem> fetch({String? nextUrlToLoad}) async {
    var url = nextUrlToLoad != null && nextUrlToLoad.isNotEmpty
        ? Uri.parse(nextUrlToLoad)
        : Uri.parse(Config.baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final nextUrl = data['next'];
      final results = data['results'];
      final List<PokemonItem> pokemonItemList = results
          .map<PokemonItem>((value) => PokemonItem.fromJson(value))
          .toList();
      List<PokemonDetailItem> pokemonDetailList = [];
      for (var pokemonItem in pokemonItemList) {
        pokemonDetailList.add(await fetchPokemonDetail(pokemonItem.url));
      }
      return PokemonListItem(nextUrl: nextUrl, pokemonDetailList: pokemonDetailList);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<PokemonTypeItem>> fetchTypes() async {
    List<PokemonTypeItem> pokemonItemList = [];
    var url = Uri.parse(Config.typesUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['results'];
      pokemonItemList = results
          .map<PokemonTypeItem>((value) => PokemonTypeItem.fromJson(value))
          .toList();
      return pokemonItemList;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<PokemonDetailItem>> fetchPokemonListByType(String url) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['pokemon'];
      final List<PokemonItem> pokemonItemList = results
          .map<PokemonItem>((value) => PokemonItem.fromJson(value['pokemon']))
          .toList();
      List<PokemonDetailItem> pokemonDetailList = [];
      for (var pokemonItem in pokemonItemList) {
        var urlDetail = Uri.parse(pokemonItem.url);
        var responseItem = await http.get(urlDetail);
        if (response.statusCode == 200) {
          try {
            final result = jsonDecode(responseItem.body);
            pokemonDetailList.add(PokemonDetailItem.fromJson(result));
          } on Exception catch (e) {
            print(e);
          }
        } else {
          throw Exception();
        }
      }
      return pokemonDetailList;
    } else {
      throw Exception();
    }
  }

  @override
  Future<PokemonDetailItem> fetchPokemonDetail(String url) async {
    var urlDetail = Uri.parse(url);
    var response = await http.get(urlDetail);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return PokemonDetailItem.fromJson(result);
    } else {
      throw Exception();
    }
  }
}
