import '../../entities/user_entity.dart';
import '../../repositories/firebase_repository.dart';

class SignInUseCase {
  final Repository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signIn(user);
  }
}
