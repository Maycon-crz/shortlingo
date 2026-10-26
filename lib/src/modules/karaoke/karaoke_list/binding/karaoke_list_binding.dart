import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_list/controller/karaoke_list_controller.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_list/repository/karaoke_list_repository.dart';

class KaraokeListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KaraokeListRepository());
    Get.lazyPut(
      () => KaraokeListController(repository: Get.find<KaraokeListRepository>()),
    );
  }
}
