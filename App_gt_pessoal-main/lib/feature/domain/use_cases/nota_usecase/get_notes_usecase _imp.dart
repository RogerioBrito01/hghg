import 'package:nota/feature/domain/use_cases/nota_usecase/get_notes_usecase.dart';

import '../../entities/note_entity.dart';
import '../../repositories/firebase_repository.dart';

class GetNotesUseCaseImp implements GetNotesUseCase {
  final Repository repository;

  GetNotesUseCaseImp({required this.repository});

  Stream<List<NoteEntity>> call(String uid) {
    return repository.getNotes(uid);
  }
}
