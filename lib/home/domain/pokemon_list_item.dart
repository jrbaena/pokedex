import 'package:pokedex/home/domain/pokemon_detail_item.dart';
import 'package:pokedex/home/domain/pokemon_item.dart';

class PokemonListItem {
  final String nextList;
  final List<PokemonDetailItem> pokemonList;

  PokemonListItem({required this.nextList, required this.pokemonList});

  factory PokemonListItem.fromJson(Map<String, dynamic> json) {
    return PokemonListItem(
      nextList: json['nextList'],
      pokemonList: json['results']
          .map<PokemonItem>((value) => PokemonItem.fromJson(value))
          .toList(),
    );
  }
}
