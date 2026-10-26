import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_play/controller/karaoke_play_controller.dart';

class KaraokePlayView extends GetView<KaraokePlayController> {
  const KaraokePlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final song = controller.choosedMusicDTO.value;
      if (song == null) return const SizedBox.shrink();
      final maxMs = controller.duration.value.inMilliseconds.toDouble();
      final posMs = controller.position.value.inMilliseconds
          .toDouble()
          .clamp(0, maxMs > 0 ? maxMs : 1);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: controller.closeSong,
              ),
              Expanded(
                child: Text('${song.songName} - ${song.artist}',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(controller.isPlaying.value
                    ? Icons.pause_circle
                    : Icons.play_circle),
                iconSize: 40,
                onPressed: controller.togglePlay,
              ),
              Expanded(
                child: Slider(
                  value: posMs.toDouble(),
                  max: maxMs > 0 ? maxMs : 1,
                  onChanged: maxMs > 0
                      ? (v) => controller.seek(Duration(milliseconds: v.round()))
                      : null,
                ),
              ),
              Text(controller.formatDuration(controller.position.value)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(controller.fileName.value ?? 'Nenhum áudio selecionado',
                    overflow: TextOverflow.ellipsis),
              ),
              TextButton.icon(
                onPressed: controller.pickFile,
                icon: const Icon(Icons.audio_file),
                label: const Text('Escolher áudio'),
              ),
            ],
          ),
          SwitchListTile(
            title: const Text('Mostrar todas as traduções'),
            value: controller.showTranslation.value,
            onChanged: (_) => controller.toggleShowTranslation(),
          ),
          for (var i = 0; i < song.phrases.length; i++) _phraseTile(context, i),
        ],
      );
    });
  }

  Widget _phraseTile(BuildContext context, int i) {
    final phrase = controller.choosedMusicDTO.value!.phrases[i];
    final selected = controller.selectedPhraseIndex.value == i;
    return Card(
      color: selected ? Theme.of(context).colorScheme.primaryContainer : null,
      child: ListTile(
        title: Text(phrase.originalPhrase,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: controller.isTranslationVisible(i)
            ? Text(phrase.translatedPhrase)
            : null,
        trailing: IconButton(
          icon: Icon(controller.isTranslationVisible(i)
              ? Icons.visibility_off
              : Icons.translate),
          onPressed: () => controller.toggleIndividualTranslation(i),
        ),
        onTap: () => controller.selectedPhraseIndex.value = i,
      ),
    );
  }
}
