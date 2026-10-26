import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_play/controller/karaoke_play_controller.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_play/repository/karaoke_play_repository.dart';

class KaraokePlayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KaraokePlayRepository());
    Get.lazyPut(
      () => KaraokePlayController(repository: Get.find<KaraokePlayRepository>()),
    );
  }
}
