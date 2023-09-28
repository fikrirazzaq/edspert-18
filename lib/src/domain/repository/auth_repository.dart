import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning/src/data/model/register_user_request_model.dart';
import 'package:learning/src/domain/entity/user_response_entity.dart';

abstract class AuthRepository {
  // Untuk cek apakah user signed-in with Google?
  bool isSignedInWithGoogle();

  // Untuk get current signed-in email from Google Sign In.
  String? getCurrentSignedInEmail();

  // Untuk cek apakah user registered?
  Future<UserDataEntity?> getUserByEmail({required String email});

  // Untuk popup signin with Google & SignIn with email.
  Future<User?> signInWithGoogle();

  Future<bool> registerUser({required RegisterUserRequestModel request});

  Future<bool> isUserRegistered();

  Future<bool> signOut();
}
