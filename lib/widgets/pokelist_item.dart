// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constants/constants.dart';

import 'package:pokemon_app/model/pokemon_model.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.w),
      ),
      elevation: 3,
      shadowColor: Colors.white,
      color: Colors.red.shade200,
      child: Column(
        children: [
          Text(
            pokemon.name ?? '',
            style: Constants.getPokemonNameTextStyle(),
          ),
          Chip(label: Text(pokemon.type![0])),
        ],
      ),
    );
  }
}
