import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/dto/karaoke_dto.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_list/repository/karaoke_list_repository.dart';

class KaraokeListController extends GetxController {
  final KaraokeListRepository _repository;

  KaraokeListController({required KaraokeListRepository repository})
      : _repository = repository;

  final songs = <KaraokeDTO>[].obs;
  final openMusicRegistration = false.obs;

  @override
  void onInit() {
    super.onInit();
    toLoadMusicController();
  }

  Future<void> toLoadMusicController() async {
    songs.assignAll(await _repository.getSongs());
  }

  Future<void> deleteSong(KaraokeDTO song) async {
    await _repository.deleteSong(song.songId);
    await toLoadMusicController();
  }
}
