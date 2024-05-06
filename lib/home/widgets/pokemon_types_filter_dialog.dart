import 'package:flutter/material.dart';
import 'package:pokedex/home/domain/pokemon_type.dart';

class PokemonTypesFilterDialog extends StatelessWidget {
  const PokemonTypesFilterDialog({super.key, required this.pokemonTypeList});

  final List<PokemonTypeItem> pokemonTypeList;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: pokemonTypeList.isNotEmpty
            ? ListView.builder(
                itemCount: pokemonTypeList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, pokemonTypeList[index]);
                    },
                    child: ListTile(
                      title: Text(pokemonTypeList[index].name),
                    ),
                  );
                })
            : const Center(
                child: Text('No se han encontrado tipos de pokemon'),
              ),
      ),
    );
  }
}
