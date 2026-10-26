import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/dto/karaoke_dto.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_list/controller/karaoke_list_controller.dart';

class KaraokeListView extends GetView<KaraokeListController> {
  final void Function(KaraokeDTO song) onSongTap;

  const KaraokeListView({super.key, required this.onSongTap});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.songs.isEmpty) {
        return const Padding(
          padding: EdgeInsets.all(32),
          child: Center(child: Text('Nenhuma música cadastrada.')),
        );
      }
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.songs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final song = controller.songs[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.music_note),
              title: Text(song.songName),
              subtitle: Text('${song.artist} • ${song.phrases.length} frases'),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => controller.deleteSong(song),
              ),
              onTap: () => onSongTap(song),
            ),
          );
        },
      );
    });
  }
}
