import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/bloc/home_cubit.dart';
import 'package:pokedex/home/repositories/pokemon_respository_impl.dart';
import 'package:pokedex/home/widgets/pokemon_appbar_widget.dart';
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
    _homeCubit =
        HomeCubit(RepositoryProvider.of<PokemonRepositoryImpl>(context));
    _homeCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCubit,
      child: const Scaffold(
        appBar: PokemonAppBarWidget(),
        body: SafeArea(
          child: PokemonListWidget(),
        ),
      ),
    );
  }
}
