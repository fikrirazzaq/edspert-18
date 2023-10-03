part of 'auth_bloc.dart';

class AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class IsUserRegisteredEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final RegisterUserRequestModel request;

  RegisterUserEvent({required this.request});
}

class SignOutEvent extends AuthEvent {}

class GetUserProfileEvent extends AuthEvent {}
