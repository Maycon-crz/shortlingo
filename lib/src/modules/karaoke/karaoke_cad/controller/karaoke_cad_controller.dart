import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/modules/karaoke/dto/karaoke_phrase_dto.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_cad/repository/karaoke_cad_repository.dart';

class KaraokeCadController extends GetxController {
  final KaraokeCadRepository _repository;

  KaraokeCadController({required KaraokeCadRepository repository})
      : _repository = repository;

  final formKey = GlobalKey<FormState>();
  final songNameController = TextEditingController();
  final artistController = TextEditingController();
  final originalPhraseController = TextEditingController();
  final translatedPhraseController = TextEditingController();
  final phrases = <KaraokePhraseDTO>[].obs;

  int _phraseSeq = 1;

  void addPhrase() {
    final original = originalPhraseController.text.trim();
    final translated = translatedPhraseController.text.trim();
    if (original.isEmpty || translated.isEmpty) {
      Get.snackbar('Atenção', 'Preencha a frase e a tradução.');
      return;
    }
    phrases.add(KaraokePhraseDTO(
      id: _phraseSeq++,
      originalPhrase: original,
      translatedPhrase: translated,
    ));
    originalPhraseController.clear();
    translatedPhraseController.clear();
  }

  void removePhrase(KaraokePhraseDTO phrase) => phrases.remove(phrase);

  /// Retorna true se a música foi salva.
  Future<bool> saveSong() async {
    if (!(formKey.currentState?.validate() ?? false)) return false;
    if (phrases.isEmpty) {
      Get.snackbar('Atenção', 'Adicione ao menos uma frase.');
      return false;
    }
    await _repository.saveSong(
      songName: songNameController.text.trim(),
      artist: artistController.text.trim(),
      phrases: List.of(phrases),
    );
    songNameController.clear();
    artistController.clear();
    phrases.clear();
    return true;
  }

  @override
  void onClose() {
    songNameController.dispose();
    artistController.dispose();
    originalPhraseController.dispose();
    translatedPhraseController.dispose();
    super.onClose();
  }
}
