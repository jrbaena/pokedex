import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/bloc/home_cubit.dart';
import 'package:pokedex/home/domain/pokemon_type.dart';
import 'package:pokedex/home/widgets/pokemon_types_filter_dialog.dart';

class PokemonAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PokemonAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder(
      bloc: homeCubit,
      builder: (context, state) {
        String? type;

        if (state is LoadingHomeState) {
          type = state.type;
        }

        return AppBar(
          backgroundColor: Colors.white,
          title: type != null ? Text('Pokédex $type') : const Text('Pokédex'),
          shadowColor: Colors.black.withOpacity(0.75),
          elevation: 12.5,
          leadingWidth: 51.0,
          toolbarHeight: 65,
          leading: InkWell(
            onTap: () => homeCubit.reload(),
            child: Container(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset('assets/images/icons/pokeball.png'),
            ),
          ),
          actions: [
            IconButton(
              onPressed: homeCubit.state is LoadedHomeState
                  ? () async {
                      final PokemonTypeItem pokemonTypeSelected =
                          await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return PokemonTypesFilterDialog(
                            pokemonTypeList:
                                (homeCubit.state as LoadedHomeState)
                                        .pokemonTypeList ??
                                    [],
                          );
                        },
                      );
                      homeCubit.getPokemonListFromType(pokemonTypeSelected);
                    }
                  : () {},
              icon: const Icon(Icons.wifi),
              padding: const EdgeInsets.only(right: 16.0),
            )
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
