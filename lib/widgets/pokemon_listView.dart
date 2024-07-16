import 'package:flutter/material.dart';
import 'package:pokemon_app/constants/u%C4%B1_helper.dart';
import 'package:pokemon_app/widgets/pokelist_item.dart';

import '../model/pokemon_model.dart';
import '../services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> _listem = snapshot.data!;
            return GridView.builder(
              itemCount: _listem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: UIHelper.getGridViewItemCount()),
              itemBuilder: (context, index) =>
                  PokeListItem(pokemon: _listem[index]),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('hata çıktı'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
