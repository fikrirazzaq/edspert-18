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

/// Sign Out
class LoadingSignOutState extends AuthState {}

class SuccessSignOutState extends AuthState {}

class ErrorSignOutState extends AuthState {
  final String message;

  ErrorSignOutState({required this.message});
}

/// Register User
class LoadingRegisterUserState extends AuthState {}

class SuccessRegisterUserState extends AuthState {}

class ErrorRegisterUserState extends AuthState {
  final String message;

  ErrorRegisterUserState({required this.message});
}

/// Get User Profile
class LoadingGetUserProfileState extends AuthState {}

class SuccessGetUserProfileState extends AuthState {
  final UserDataEntity userDataEntity;

  SuccessGetUserProfileState({required this.userDataEntity});
}

class ErrorGetUserProfileState extends AuthState {
  final String message;

  ErrorGetUserProfileState({required this.message});
}
