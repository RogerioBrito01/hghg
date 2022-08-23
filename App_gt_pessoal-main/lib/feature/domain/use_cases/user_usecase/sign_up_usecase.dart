import '../../entities/user_entity.dart';
import '../../repositories/firebase_repository.dart';

class SignUPUseCase {
  final Repository repository;

  SignUPUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signUp(user);
  }
}
