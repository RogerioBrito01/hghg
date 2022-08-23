import '../../repositories/firebase_repository.dart';

import 'get_current_uid_usecase.dart';

class GetCurrentUidUseCaseImp implements GetCurrentUidUseCase {
  final Repository repository;

  GetCurrentUidUseCaseImp({required this.repository});

  Future<String> call() async {
    return repository.getCurrentUId();
  }
}
