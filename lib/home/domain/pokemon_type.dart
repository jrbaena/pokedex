import 'package:pokedex/home/domain/pokemon_detail_item.dart';
import 'package:pokedex/home/domain/pokemon_item.dart';

class PokemonTypeListItem {
  final String nextList;
  final List<PokemonDetailItem> pokemonList;

  PokemonTypeListItem({required this.nextList, required this.pokemonList});

  factory PokemonTypeListItem.fromJson(Map<String, dynamic> json) {
    return PokemonTypeListItem(
      nextList: json['nextList'],
      pokemonList: json['results']
          .map<PokemonItem>((value) => PokemonItem.fromJson(value))
          .toList(),
    );
  }
}

class PokemonTypeItem {
  final String name;
  final String url;

  PokemonTypeItem({
    required this.name,
    required this.url,
  });

  factory PokemonTypeItem.fromJson(Map<String, dynamic> json) {
    return PokemonTypeItem(
      name: json['name'],
      url: json['url'],
    );
  }
}

