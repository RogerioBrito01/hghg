import '../../repositories/firebase_repository.dart';

class SignOutUseCase {
  final Repository repository;

  SignOutUseCase({required this.repository});

  Future<void> call() async {
    return repository.signOut();
  }
}
