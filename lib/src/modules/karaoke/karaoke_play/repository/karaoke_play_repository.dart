import 'package:file_picker/file_picker.dart';

class KaraokePlayRepository {
  /// Retorna o caminho do áudio escolhido pelo usuário, ou null se cancelou.
  Future<({String path, String name})?> pickAudio() async {
    final result = await FilePicker.pickFiles(type: FileType.audio);
    final file = result?.files.single;
    if (file?.path == null) return null;
    return (path: file!.path!, name: file.name);
  }
}
