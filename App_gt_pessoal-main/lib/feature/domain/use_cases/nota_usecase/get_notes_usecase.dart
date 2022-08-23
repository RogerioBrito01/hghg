import '../../entities/note_entity.dart';

abstract class GetNotesUseCase {
  Stream<List<NoteEntity>> call(String uid);
}
