import '../../entities/note_entity.dart';
import '../../repositories/firebase_repository.dart';

import 'delete_note_usecase.dart';

class DeleteNoteUseCaseImp implements DeleteNoteUseCase {
  final Repository repository;

  DeleteNoteUseCaseImp({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.deleteNote(note);
  }
}
