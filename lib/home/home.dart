import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/bloc/home_cubit.dart';
import 'package:pokedex/home/domain/pokemon_type.dart';
import 'package:pokedex/home/repositories/pokemon_respository_impl.dart';
import 'package:pokedex/home/widgets/pokemon_list_widget.dart';
import 'package:pokedex/home/widgets/pokemon_types_filter_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit =
        HomeCubit(RepositoryProvider.of<PokemonRepositoryImpl>(context));
    _homeCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Pokédex'),
          shadowColor: Colors.black.withOpacity(0.75),
          elevation: 12.5,
          leadingWidth: 51.0,
          toolbarHeight: 65,
          leading: InkWell(
            onTap: () => _homeCubit.reload(),
            child: Container(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset('assets/images/icons/pokeball.png'),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final PokemonTypeItem pokemonSelected = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      if (_homeCubit.state is LoadedHomeState) {
                        return PokemonTypesFilterDialog( pokemonTypeList: (_homeCubit.state as LoadedHomeState).pokemonTypeList ?? []);
                      }
                      return Container();
                    },);
                _homeCubit.getPokemonListFromType(pokemonSelected.url);
              },
              icon: const Icon(Icons.wifi),
              padding: const EdgeInsets.only(right: 16.0),
            )
          ],
        ),
        body: const SafeArea(
          child: PokemonListWidget(),
        ),
      ),
    );
  }
}
