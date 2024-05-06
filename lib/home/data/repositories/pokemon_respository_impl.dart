import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokedex/core/config/config.dart';
import 'package:pokedex/home/domain/models/pokemon_detail_item.dart';
import 'package:pokedex/home/domain/models/pokemon_item.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/home/domain/models/pokemon_list_item.dart';
import 'package:pokedex/home/domain/models/pokemon_type.dart';
import 'package:pokedex/home/domain/repositories/pokemon_repository.dart';



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
      return PokemonListItem(
          nextUrl: nextUrl, pokemonDetailList: pokemonDetailList);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<PokemonTypeItem>> fetchTypes() async {
    List<PokemonTypeItem> pokemonTypeItemList = [];
    var url = Uri.parse(Config.typesUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['results'];
      pokemonTypeItemList = results
          .map<PokemonTypeItem>((value) => PokemonTypeItem.fromJson(value))
          .toList();
      String? next = jsonDecode(response.body)['next'];
      try {
        var urlNext = Uri.parse(next!);
        var responseNext = await http.get(urlNext);
        final resultsNext = jsonDecode(responseNext.body)['results'];
        pokemonTypeItemList.addAll(resultsNext
            .map<PokemonTypeItem>((value) => PokemonTypeItem.fromJson(value))
            .toList());
      } catch (_) {}
      return pokemonTypeItemList;
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
            Fluttertoast.showToast(
                msg: "[Error]: $e",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
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
