import 'package:pokedex/core/utils/enums.dart';

class Pokemon {
  final int id;
  final String name;
  final PokemonType type;

  Pokemon({
    required this.id,
    required this.name,
    required this.type,
  });
}