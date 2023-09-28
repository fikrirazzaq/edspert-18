import 'package:learning/src/domain/repository/auth_repository.dart';

class GetCurrentSignedInEmailUsecase {
  final AuthRepository repository;

  const GetCurrentSignedInEmailUsecase({required this.repository});

  String? call() => repository.getCurrentSignedInEmail();
}
