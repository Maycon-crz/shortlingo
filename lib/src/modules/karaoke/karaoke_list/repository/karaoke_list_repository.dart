import 'package:shortlingo/src/modules/karaoke/dto/karaoke_dto.dart';
import 'package:shortlingo/src/modules/karaoke/dto/karaoke_phrase_dto.dart';

/// Armazena as músicas em memória enquanto a API não existe.
class KaraokeListRepository {
  final List<KaraokeDTO> _songs = [
    KaraokeDTO(
      songId: 1,
      songName: 'Let It Be',
      artist: 'The Beatles',
      createdAt: DateTime(2024, 1, 1),
      phrases: [
        KaraokePhraseDTO(
          id: 1,
          originalPhrase: 'When I find myself in times of trouble',
          translatedPhrase: 'Quando me encontro em tempos de dificuldade',
        ),
        KaraokePhraseDTO(
          id: 2,
          originalPhrase: 'Mother Mary comes to me',
          translatedPhrase: 'A Mãe Maria vem até mim',
        ),
        KaraokePhraseDTO(
          id: 3,
          originalPhrase: 'Speaking words of wisdom, let it be',
          translatedPhrase: 'Falando palavras de sabedoria, deixe estar',
        ),
      ],
    ),
  ];

  int _nextId = 2;

  Future<List<KaraokeDTO>> getSongs() async => List.unmodifiable(_songs);

  Future<void> addSong({
    required String songName,
    required String artist,
    required List<KaraokePhraseDTO> phrases,
  }) async {
    _songs.add(KaraokeDTO(
      songId: _nextId++,
      songName: songName,
      artist: artist,
      createdAt: DateTime.now(),
      phrases: phrases,
    ));
  }

  Future<void> deleteSong(int songId) async {
    _songs.removeWhere((s) => s.songId == songId);
  }
}
