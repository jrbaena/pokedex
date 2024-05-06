import 'package:flutter/material.dart';
import 'package:pokedex/home/domain/models/pokemon_type.dart';

class PokemonTypesFilterDialog extends StatelessWidget {
  const PokemonTypesFilterDialog({super.key, required this.pokemonTypeList});

  final List<PokemonTypeItem> pokemonTypeList;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Selecciona el tipo',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
          ),
          if (pokemonTypeList.isNotEmpty)
            Expanded(
              child: ListView.builder(
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
                  }),
            )
          else
            const Center(
              child: Text('No se han encontrado tipos de pokemon'),
            ),
        ],
      ),
    );
  }
}
