import 'package:flutter/material.dart';

class Constants {
  //Artık bundan nesne üretilmeyecek.
  Constants._();
  static const String title = 'Pokedex';
  static String pokemonPath = 'images/pokeball.png';

  static TextStyle getTitleTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 48,
    );
  }
}
