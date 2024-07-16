// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constants/constants.dart';
import 'package:pokemon_app/constants/u%C4%B1_helper.dart';
import 'package:pokemon_app/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', pokemon.name, context),
            _buildInformationRow('Height', pokemon.height, context),
            _buildInformationRow('Weight', pokemon.weight, context),
            _buildInformationRow('Spawn Time', pokemon.spawnTime, context),
            _buildInformationRow('Weakness', pokemon.weaknesses, context),
            _buildInformationRow(
                'Pre Evolution',
                pokemon.prevEvolution?.map((e) => e.name).toList() ?? [],
                context),
            _buildInformationRow(
                'Next Evolution',
                pokemon.nextEvolution?.map((e) => e.name).toList() ?? [],
                context),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokeInfoLabelTextStyle(context),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(', '),
            style: Constants.getPokeInfoTextStyle(context),
          )
        else if (value == null)
          Text(
            'Not available',
            style: Constants.getPokeInfoTextStyle(context),
          )
        else
          Text(
            value.toString(),
            style: Constants.getPokeInfoTextStyle(context),
          ),
      ],
    );
  }
}
