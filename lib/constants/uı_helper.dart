import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();
  // ScreenUtil().orientation ifadesi kullanılarak ekranın yönelimi kontrol ediliyor.
  //Bu, cihazın dikey (portrait) mi yoksa yatay (landscape) mı olduğunu belirler.
  // 0.15.sh ve 0.15.sw ifadeleri sırasıyla ekran yüksekliğinin ve genişliğinin %15'ini temsil eder. Bu hesaplama, ekran yönelimine bağlı olarak değişir.
  // Bu sayede, uygulamanızın başlık widget'ının boyutu, cihazın yönelimine göre uyum sağlar.
  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static double getAppTitleImageAssetWidth() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw;
  }

  static final Map<String, Color> _typeColorMap = {
    'Grass': Colors.green,
    'Fire': Colors.redAccent,
    'Water': Colors.blue,
    'Electric': Colors.yellow,
    'Rock': Colors.grey,
    'Ground': Colors.brown,
    'Bug': Colors.lightGreenAccent.shade700,
    'Psychic': Colors.indigo,
    'Fighting': Colors.orange,
    'Ghost': Colors.deepPurple,
    'Normal': Colors.black26,
    'Poison': Colors.deepPurpleAccent
  };

  static Color getColorFromType(String type) {
    if (_typeColorMap.containsKey(type)) {
      return _typeColorMap[type] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }

  static int getGridViewItemCount() {
    return ScreenUtil().orientation == Orientation.portrait ? 2 : 3;
  }

  static double calculatePokeImgAndBallSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.3.sw;
    } else {
      return 0.4.sh;
    }
  }

  static double calculateIconButtonSize(BuildContext context) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.03;
    } else {
      return MediaQuery.of(context).size.width * 0.03;
    }
  }
}
