import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  //Artık bundan nesne üretilmeyecek.
  Constants._();
  static const String title = 'Pokedex';
  static String pokemonPath = 'images/pokeball.png';

  static TextStyle getTitleTextStyle(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(context),
    );
  }

  static TextStyle getPokemonNameTextStyle(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(context),
    );
  }

  static TextStyle getTypeChipTextStyle(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(context),
    );
  }

  // sp, kullanıcıların tercih ettiği yazı tipi boyutu ayarlarına
  //  ve ekranın piksel yoğunluğuna göre metnin uygun şekilde ölçeklenmesini sağlar.

  static _calculateFontSize(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.10;
    if (ScreenUtil().orientation == Orientation.portrait) {
      return (size).sp;
    } else {
      return (size).sp;
    }
  }

  static getPokeInfoTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: _calculateFontSize(context),
      color: Colors.black,
    );
  }

  static getPokeInfoLabelTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: _calculateFontSize(context),
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }
}
