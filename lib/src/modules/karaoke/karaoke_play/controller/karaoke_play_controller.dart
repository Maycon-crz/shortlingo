import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shortlingo/src/modules/karaoke/dto/karaoke_dto.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_play/repository/karaoke_play_repository.dart';

class KaraokePlayController extends GetxController {
  final KaraokePlayRepository _repository;

  KaraokePlayController({required KaraokePlayRepository repository})
      : _repository = repository;

  final choosedMusicDTO = Rxn<KaraokeDTO>();
  final openMusicKaraoke = false.obs;
  final selectedPhraseIndex = Rxn<int>();
  final showTranslation = false.obs;
  final individualTranslationVisible = <int>{}.obs;

  final AudioPlayer player = AudioPlayer();
  final fileName = RxnString();
  final isPlaying = false.obs;
  final duration = Duration.zero.obs;
  final position = Duration.zero.obs;

  @override
  void onInit() {
    super.onInit();
    player.durationStream.listen((d) => duration.value = d ?? Duration.zero);
    player.positionStream.listen((p) => position.value = p);
    player.playerStateStream.listen((s) => isPlaying.value = s.playing);
  }

  Future<void> selectSong(KaraokeDTO song) async {
    if (choosedMusicDTO.value?.songId != song.songId) {
      await resetPlayer();
    }
    choosedMusicDTO.value = song;
    selectedPhraseIndex.value = null;
    showTranslation.value = false;
    individualTranslationVisible.clear();
    openMusicKaraoke.value = true;
  }

  Future<void> closeSong() async {
    await resetPlayer();
    openMusicKaraoke.value = false;
  }

  Future<void> pickFile() async {
    final audio = await _repository.pickAudio();
    if (audio == null) return;
    await player.setFilePath(audio.path);
    fileName.value = audio.name;
  }

  Future<void> resetPlayer() async {
    await player.stop();
    fileName.value = null;
    duration.value = Duration.zero;
    position.value = Duration.zero;
  }

  void togglePlay() {
    if (fileName.value == null) return;
    isPlaying.value ? player.pause() : player.play();
  }

  void seek(Duration d) => player.seek(d);

  void toggleShowTranslation() {
    showTranslation.toggle();
    individualTranslationVisible.clear();
  }

  void toggleIndividualTranslation(int index) {
    if (!individualTranslationVisible.remove(index)) {
      individualTranslationVisible.add(index);
    }
  }

  bool isTranslationVisible(int index) =>
      showTranslation.value || individualTranslationVisible.contains(index);

  String formatDuration(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(d.inMinutes.remainder(60))}:${two(d.inSeconds.remainder(60))}';
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
