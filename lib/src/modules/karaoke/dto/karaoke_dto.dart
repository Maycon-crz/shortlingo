import 'package:shortlingo/src/modules/karaoke/dto/karaoke_phrase_dto.dart';

class KaraokeDTO {
  final int songId;
  final String songName;
  final String artist;
  final DateTime createdAt;
  final List<KaraokePhraseDTO> phrases;

  KaraokeDTO({
    required this.songId,
    required this.songName,
    required this.artist,
    required this.createdAt,
    required this.phrases,
  });
}
