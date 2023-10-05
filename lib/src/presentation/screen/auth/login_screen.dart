import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/presentation/router/routes.dart';

import '../../blocs/auth/auth_bloc.dart';
import 'login_body_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (current is LoadingSignInWithGoogleState) ||
          (previous is LoadingSignInWithGoogleState &&
              current is SuccessSignInWithGoogleState) ||
          (previous is LoadingSignInWithGoogleState &&
              current is ErrorIsUserRegisteredState) ||
          (previous is LoadingIsUserRegisteredState &&
              current is SuccessIsUserRegisteredState) ||
          (previous is LoadingIsUserRegisteredState &&
              current is ErrorIsUserRegisteredState),
      listener: (context, state) {
        /// Sign In With Google Action Handler
        if (state is SuccessSignInWithGoogleState) {
          context.read<AuthBloc>().add(IsUserRegisteredEvent());
        }

        if (state is ErrorSignInWithGoogleState) {
          debugPrint('SignIn Error: ${state.message}');
        }

        /// Is User Registered Action Handler
        if (state is SuccessIsUserRegisteredState) {
          Navigator.of(context).pushNamed(Routes.homeScreen);
        }

        if (state is ErrorIsUserRegisteredState) {
          Navigator.of(context).pushNamed(Routes.registrationFormScreen);
        }
      },
      child: const Scaffold(
        body: SafeArea(
          child: LoginBodyWidget(),
        ),
      ),
    );
  }
}
