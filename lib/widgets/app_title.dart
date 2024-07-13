import 'package:flutter/material.dart';
import 'package:pokemon_app/constants/constants.dart';
import 'package:pokemon_app/constants/u%C4%B1_helper.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.title,
                style: Constants.getTitleTextStyle(),
              )),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              Constants.pokemonPath,
              width: UIHelper.getAppTitleImageAssetWidth(),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
