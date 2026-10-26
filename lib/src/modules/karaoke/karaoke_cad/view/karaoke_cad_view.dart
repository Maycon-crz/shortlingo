import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_cad/controller/karaoke_cad_controller.dart';

class KaraokeCadView extends GetView<KaraokeCadController> {
  final VoidCallback onSaved;

  const KaraokeCadView({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.songNameController,
            decoration: const InputDecoration(
                labelText: 'Nome da música', border: OutlineInputBorder()),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Informe o nome' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.artistController,
            decoration: const InputDecoration(
                labelText: 'Artista', border: OutlineInputBorder()),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Informe o artista' : null,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.originalPhraseController,
            decoration: const InputDecoration(
                labelText: 'Frase em inglês', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.translatedPhraseController,
            decoration: const InputDecoration(
                labelText: 'Tradução', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton.icon(
              onPressed: controller.addPhrase,
              icon: const Icon(Icons.add),
              label: const Text('Adicionar frase'),
            ),
          ),
          Obx(
            () => Column(
              children: [
                for (final phrase in controller.phrases)
                  ListTile(
                    dense: true,
                    title: Text(phrase.originalPhrase),
                    subtitle: Text(phrase.translatedPhrase),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => controller.removePhrase(phrase),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () async {
                if (await controller.saveSong()) onSaved();
              },
              child: const Text('Salvar música'),
            ),
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}
