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
}
