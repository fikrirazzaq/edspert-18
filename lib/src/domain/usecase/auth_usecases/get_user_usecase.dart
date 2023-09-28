import 'package:learning/src/domain/entity/user_response_entity.dart';
import 'package:learning/src/domain/repository/auth_repository.dart';

class GetUserUsecase {
  final AuthRepository repository;

  const GetUserUsecase({required this.repository});

  Future<UserDataEntity?> call(String email) async => await repository.getUserByEmail(email: email);
}
