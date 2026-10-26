import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/modules/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShortLingo'),
        actions: [
          IconButton(
            tooltip: 'Sair',
            icon: const Icon(Icons.logout),
            onPressed: controller.logout,
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.options.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final option = controller.options[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 28,
                child: Icon(option.icon),
              ),
              title: Text(option.title),
              subtitle: Text(option.description),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => controller.openOption(option),
            ),
          );
        },
      ),
    );
  }
}
