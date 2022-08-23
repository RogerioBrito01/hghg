import '../../entities/note_entity.dart';

abstract class DeleteNoteUseCase {
  Future<void> call(NoteEntity note);
}
