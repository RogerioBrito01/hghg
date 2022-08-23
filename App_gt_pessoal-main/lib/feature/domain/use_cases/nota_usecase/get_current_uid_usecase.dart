import '../../repositories/firebase_repository.dart';

abstract class GetCurrentUidUseCase {
  Future<String> call();
}
