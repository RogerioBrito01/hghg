import 'package:nota/feature/domain/use_cases/nota_usecase/update_note_usecase.dart';

import '../../entities/note_entity.dart';
import '../../repositories/firebase_repository.dart';

class UpdateNoteUseCaseImp implements UpdateNoteUseCase {
  final Repository repository;

  UpdateNoteUseCaseImp({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.updateNote(note);
  }
}
