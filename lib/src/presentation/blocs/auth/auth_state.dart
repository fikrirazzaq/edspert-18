part of 'auth_bloc.dart';

class AuthState {}

class InitAuthState extends AuthState {}

/// Sign In With Google
class LoadingSignInWithGoogleState extends AuthState {}

class SuccessSignInWithGoogleState extends AuthState {
  final String email;

  SuccessSignInWithGoogleState({required this.email});
}

class ErrorSignInWithGoogleState extends AuthState {
  final String message;

  ErrorSignInWithGoogleState({required this.message});
}

/// Is User Registered
class LoadingIsUserRegisteredState extends AuthState {}

class SuccessIsUserRegisteredState extends AuthState {
  final bool registered;

  SuccessIsUserRegisteredState({required this.registered});
}

class ErrorIsUserRegisteredState extends AuthState {
  final String message;

  ErrorIsUserRegisteredState({required this.message});
}
