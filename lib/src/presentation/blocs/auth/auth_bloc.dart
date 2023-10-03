import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning/src/data/model/register_user_request_model.dart';
import 'package:learning/src/domain/usecase/auth_usecases/is_signed_in_with_google_usecase.dart';
import 'package:learning/src/domain/usecase/auth_usecases/is_user_registered_usecase.dart';
import 'package:learning/src/domain/usecase/auth_usecases/sign_in_with_google_usecase.dart';
import 'package:learning/src/domain/usecase/auth_usecases/usecases.dart';

import '../../../domain/entity/user_response_entity.dart';
import '../../../domain/usecase/auth_usecases/sign_out_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignedInWithGoogleUsecase isSignedInWithGoogleUsecase;
  final IsUserRegisteredUsecase isUserRegisteredUsecase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  final GetCurrentSignedInEmailUsecase getCurrentSignedInEmailUsecase;
  final SignOutUsecase signOutUsecase;
  final RegisterUserUsecase registerUserUsecase;
  final GetUserUsecase getUserUsecase;

  AuthBloc(
    this.isSignedInWithGoogleUsecase,
    this.isUserRegisteredUsecase,
    this.signInWithGoogleUsecase,
    this.getCurrentSignedInEmailUsecase,
    this.signOutUsecase,
    this.registerUserUsecase,
    this.getUserUsecase,
  ) : super(InitAuthState()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInWithGoogleEvent) {
        emit(LoadingSignInWithGoogleState());
        User? user = await signInWithGoogleUsecase();
        if (user != null) {
          emit(SuccessSignInWithGoogleState(email: user.email!));
        } else {
          emit(ErrorSignInWithGoogleState(message: 'Error Sign-In with Google'));
        }
      }

      if (event is IsUserRegisteredEvent) {
        emit(LoadingIsUserRegisteredState());
        bool registered = await isUserRegisteredUsecase();
        if (registered) {
          emit(SuccessIsUserRegisteredState(registered: registered));
        } else {
          emit(ErrorIsUserRegisteredState(message: 'User not registered!'));
        }
      }

      if (event is SignOutEvent) {
        emit(LoadingSignOutState());
        bool registered = await signOutUsecase();
        if (registered) {
          emit(SuccessSignOutState());
        } else {
          emit(ErrorSignOutState(message: 'Sign out failed!'));
        }
      }

      if (event is RegisterUserEvent) {
        emit(LoadingRegisterUserState());
        bool registerUser = await registerUserUsecase(event.request);
        if (registerUser) {
          emit(SuccessRegisterUserState());
        } else {
          emit(ErrorRegisterUserState(message: 'Register failed!'));
        }
      }

      if (event is GetUserProfileEvent) {
        emit(LoadingGetUserProfileState());
        UserDataEntity? getUser = await getUserUsecase(getCurrentUserEmail()!);
        if (getUser != null) {
          emit(SuccessGetUserProfileState(userDataEntity: getUser));
        } else {
          emit(ErrorGetUserProfileState(message: 'Get user failed!'));
        }
      }
    });
  }

  bool isUserSignedInWithGoogle() {
    return isSignedInWithGoogleUsecase();
  }

  String? getCurrentUserEmail() {
    return getCurrentSignedInEmailUsecase();
  }
}
