import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/services/pokedex_api.dart';
import 'package:pokemon_app/widgets/app_title.dart';
import 'package:pokemon_app/widgets/pokemon_listView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTitle(),
          Expanded(child: PokemonList()),
        ],
      ),
    );
  }
}
