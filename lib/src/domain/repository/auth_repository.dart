import 'package:learning/src/data/model/register_user_request_model.dart';
import 'package:learning/src/domain/entity/user_response_entity.dart';

abstract class AuthRepository {
  bool isSignedInWithGoogle();
  String? getCurrentSignedInEmail();

  Future<UserDataEntity?> getUserByEmail({required String email});

  Future<bool> registerUser({required RegisterUserRequestModel request});

  Future<bool> isUserRegistered();

  Future<bool> signOut();
}
