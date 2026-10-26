import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_cad/binding/karaoke_cad_binding.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_list/binding/karaoke_list_binding.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_play/binding/karaoke_play_binding.dart';

class KaraokeBinding implements Bindings {
  @override
  void dependencies() {
    KaraokeListBinding().dependencies();
    KaraokeCadBinding().dependencies();
    KaraokePlayBinding().dependencies();
  }
}
