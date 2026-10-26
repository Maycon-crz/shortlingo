import 'package:shortlingo/src/modules/karaoke/dto/karaoke_phrase_dto.dart';
import 'package:shortlingo/src/modules/karaoke/karaoke_list/repository/karaoke_list_repository.dart';

class KaraokeCadRepository {
  final KaraokeListRepository _listRepository;

  KaraokeCadRepository({required KaraokeListRepository listRepository})
      : _listRepository = listRepository;

  Future<void> saveSong({
    required String songName,
    required String artist,
    required List<KaraokePhraseDTO> phrases,
  }) {
    return _listRepository.addSong(
      songName: songName,
      artist: artist,
      phrases: phrases,
    );
  }
}
