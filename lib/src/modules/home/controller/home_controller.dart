import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/routes/route_name.dart';

class HomeOption {
  final String title;
  final String description;
  final IconData icon;
  final String? route;

  const HomeOption({
    required this.title,
    required this.description,
    required this.icon,
    this.route,
  });
}

class HomeController extends GetxController {
  final options = const [
    HomeOption(
      title: 'Karaokê',
      description: 'Aprenda inglês cantando e lendo as letras',
      icon: Icons.mic,
      route: RouteName.karaoke,
    ),
  ];

  void openOption(HomeOption option) {
    if (option.route == null) {
      Get.snackbar('Em breve', '${option.title} estará disponível em breve.');
      return;
    }
    Get.toNamed(option.route!);
  }

  void logout() => Get.offAllNamed(RouteName.login);
}
