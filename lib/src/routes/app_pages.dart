import 'package:get/get.dart';
import 'package:shortlingo/src/modules/home/binding/home_binding.dart';
import 'package:shortlingo/src/modules/home/view/home_page.dart';
import 'package:shortlingo/src/modules/karaoke/binding/karaoke_binding.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_page.dart';
import 'package:shortlingo/src/modules/login/binding/login_binding.dart';
import 'package:shortlingo/src/modules/login/view/login_page.dart';
import 'package:shortlingo/src/routes/route_name.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.login,
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteName.home,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteName.karaoke,
      binding: KaraokeBinding(),
      page: () => const KaraokePage(),
    ),
  ];
}
