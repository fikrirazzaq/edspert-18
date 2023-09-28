import 'package:learning/src/domain/repository/auth_repository.dart';

class IsUserRegisteredUsecase {
  final AuthRepository repository;

  const IsUserRegisteredUsecase({required this.repository});

  Future<bool> call() async => await repository.isUserRegistered();
}
