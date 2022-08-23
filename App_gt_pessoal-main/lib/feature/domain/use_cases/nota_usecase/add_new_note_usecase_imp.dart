import 'package:nota/feature/domain/use_cases/nota_usecase/add_new_note_usecase.dart';

import '../../entities/note_entity.dart';
import '../../repositories/firebase_repository.dart';

class AddNewNoteUseCaseImp implements AddNewNoteUseCase {
  final Repository notarepository;

  AddNewNoteUseCaseImp({required this.notarepository});

  Future<void> call(NoteEntity note) async {
    return notarepository.addNewNote(note);
  }
}
