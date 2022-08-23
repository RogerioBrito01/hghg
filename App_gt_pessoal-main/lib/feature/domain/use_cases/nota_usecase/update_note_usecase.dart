import '../../entities/note_entity.dart';
import '../../repositories/firebase_repository.dart';

abstract class UpdateNoteUseCase {
  Future<void> call(NoteEntity note);
}
