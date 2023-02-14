
import 'package:bunda_yuni_app/page/AkunSaya.dart';
import 'package:bunda_yuni_app/page/Daftar.dart';
import 'package:bunda_yuni_app/page/Login.dart';
import 'package:bunda_yuni_app/page/base.dart';
import 'package:bunda_yuni_app/page/buktitransfer.dart';
import 'package:bunda_yuni_app/page/detailPage.dart';
import 'package:bunda_yuni_app/page/homePage.dart';
import 'package:bunda_yuni_app/page/keranjangPage.dart';
import 'package:bunda_yuni_app/page/splashScreen.dart';
import 'package:bunda_yuni_app/page/suksesPesan.dart';
import 'package:bunda_yuni_app/page/welcomePage.dart';
import 'package:provider/provider.dart';


import 'genosLib/bloc/baseBloc.dart';


class GenProvider {
  static var providers = [
    ChangeNotifierProvider<BaseBloc>.value(value: BaseBloc()),

  ];

  static routes(context) {
    return {
//           '/': (context) {
//        return Base();
//      },

      '/': (context) {
        return SplashScreen();
      },

      'bukti': (context) {
        return BuktiTransfer();
      },

      'welcome': (context) {
        return WelcomePage();
      },

      'home': (context) {
        return Base();
      },

      'detail': (context) {
        return DetailPage();
      },

      'keranjang': (context) {
        return KeranjangPage();
      },

      'login': (context) {
        return LoginPage();
      },

      'daftar': (context) {
        return DaftarPage();
      },

      'akun': (context) {
        return AkunSaya();
      },

      'suksesPesan': (context) {
        return SuksesPesanPage();
      },
    };
  }
}
