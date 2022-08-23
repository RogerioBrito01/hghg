import '../../repositories/firebase_repository.dart';

class IsSignInUseCase {
  final Repository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() async {
    return repository.isSignIn();
  }
}
