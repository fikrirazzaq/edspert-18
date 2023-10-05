import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:learning/src/presentation/screen/auth/login_screen.dart';

import '../../router/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      bool isSignedInWithGoogle =
          context.read<AuthBloc>().isUserSignedInWithGoogle();
      if (isSignedInWithGoogle) {
        context.read<AuthBloc>().add(IsUserRegisteredEvent());
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (current is LoadingIsUserRegisteredState) ||
          (previous is LoadingIsUserRegisteredState &&
              current is SuccessIsUserRegisteredState) ||
          (previous is LoadingIsUserRegisteredState &&
              current is ErrorIsUserRegisteredState),
      listener: (context, state) {
        if (state is SuccessIsUserRegisteredState) {
          Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
        }

        if (state is ErrorIsUserRegisteredState) {
          Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text('Learning'),
        ),
      ),
    );
  }
}
