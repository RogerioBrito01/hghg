import '../../entities/note_entity.dart';
import '../../repositories/firebase_repository.dart';

abstract class AddNewNoteUseCase {
  Future<void> call(NoteEntity note);
}
