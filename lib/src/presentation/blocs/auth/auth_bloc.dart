import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning/src/domain/usecase/auth_usecases/is_signed_in_with_google_usecase.dart';
import 'package:learning/src/domain/usecase/auth_usecases/is_user_registered_usecase.dart';
import 'package:learning/src/domain/usecase/auth_usecases/sign_in_with_google_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignedInWithGoogleUsecase isSignedInWithGoogleUsecase;
  final IsUserRegisteredUsecase isUserRegisteredUsecase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;

  AuthBloc(
    this.isSignedInWithGoogleUsecase,
    this.isUserRegisteredUsecase,
    this.signInWithGoogleUsecase,
  ) : super(InitAuthState()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInWithGoogleEvent) {
        emit(LoadingSignInWithGoogleState());
        User? user = await signInWithGoogleUsecase();
        if (user != null) {
          emit(SuccessSignInWithGoogleState(email: user.email!));
        } else {
          emit(
              ErrorSignInWithGoogleState(message: 'Error Sign-In with Google'));
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
    });
  }

  bool isUserSignedInWithGoogle() {
    return isSignedInWithGoogleUsecase();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
