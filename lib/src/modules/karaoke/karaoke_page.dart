import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_cad/view/karaoke_cad_view.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_list/controller/karaoke_list_controller.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_list/view/karaoke_list_view.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_play/controller/karaoke_play_controller.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_play/view/karaoke_play_view.dart';

class KaraokePage extends StatelessWidget {
  const KaraokePage({super.key});

  @override
  Widget build(BuildContext context) {
    final listController = Get.find<KaraokeListController>();
    final playController = Get.find<KaraokePlayController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Karaokê')),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!playController.openMusicKaraoke.value) ...[
                FilledButton.icon(
                  icon: Icon(listController.openMusicRegistration.value
                      ? Icons.close
                      : Icons.add),
                  label: Text(listController.openMusicRegistration.value
                      ? 'Cancelar Cadastro'
                      : 'Cadastrar Música'),
                  onPressed: listController.openMusicRegistration.toggle,
                ),
                const SizedBox(height: 12),
                if (listController.openMusicRegistration.value)
                  KaraokeCadView(
                    onSaved: () {
                      listController.toLoadMusicController();
                      listController.openMusicRegistration.value = false;
                    },
                  ),
                KaraokeListView(onSongTap: playController.selectSong),
              ] else
                const KaraokePlayView(),
            ],
          ),
        ),
      ),
    );
  }
}
