// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constants/constants.dart';
import 'package:pokemon_app/constants/u%C4%B1_helper.dart';

import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/widgets/poke_information.dart';
import 'package:pokemon_app/widgets/poke_name_type.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.2;
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, height)
        : _buildLandscapeBody(context, height);
  }

  Scaffold _buildLandscapeBody(BuildContext context, double height) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                  iconSize: UIHelper.calculateIconButtonSize(context),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeNameType(pokemon: pokemon),
                      Hero(
                        tag: pokemon.id!,
                        child: CachedNetworkImage(
                          imageUrl: pokemon.img ?? '',
                          height: 0.3.sw,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: UIHelper.getDefaultPadding(),
                      child: PokeInformation(pokemon: pokemon),
                    )),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context, double height) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                  iconSize: UIHelper.calculateIconButtonSize(context),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            PokeNameType(pokemon: pokemon),
            SizedBox(
              height: height.h,
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    Constants.pokemonPath,
                    height: 0.13.sh,
                    fit: BoxFit.fitHeight,
                  ),
                  right: 0,
                  top: 0,
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.1.sh,
                    child: PokeInformation(pokemon: pokemon)),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.2.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
