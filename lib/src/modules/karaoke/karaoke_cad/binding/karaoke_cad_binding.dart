import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_cad/controller/karaoke_cad_controller.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_cad/repository/karaoke_cad_repository.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_list/repository/karaoke_list_repository.dart';

class KaraokeCadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => KaraokeCadRepository(listRepository: Get.find<KaraokeListRepository>()),
    );
    Get.lazyPut(
      () => KaraokeCadController(repository: Get.find<KaraokeCadRepository>()),
    );
  }
}
