import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/bloc/home_cubit.dart';
import 'package:pokedex/home/repositories/pokemon_respository_impl.dart';
import 'package:pokedex/home/widgets/pokemon_list_widget.dart';

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
    _homeCubit = HomeCubit(RepositoryProvider.of<PokemonRepositoryImpl>(context));
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
          leading: Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: Image.asset('assets/images/icons/pokeball.png'),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => _getPokeDialog());
              },
              icon: const Icon(Icons.filter_hdr),
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

  Widget _getPokeDialog() {
    return Dialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('HOLA SOY UN POKEMON'),
            SizedBox(
              height: 25,
            ),
            Text('Otro texto')
          ],
        ),
      ),
    );
  }
}
