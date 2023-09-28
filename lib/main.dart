import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/firebase_options.dart';
import 'package:learning/src/data/datasource/auth_remote_datasource.dart';
import 'package:learning/src/data/repository/auth_repository_impl.dart';
import 'package:learning/src/domain/repository/auth_repository.dart';
import 'package:learning/src/domain/usecase/auth_usecases/is_signed_in_with_google_usecase.dart';
import 'package:learning/src/domain/usecase/auth_usecases/is_user_registered_usecase.dart';
import 'package:learning/src/domain/usecase/auth_usecases/sign_in_with_google_usecase.dart';
import 'package:learning/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:learning/src/presentation/router/routes.dart';
import 'package:learning/src/presentation/screen/auth/login_screen.dart';
import 'package:learning/src/presentation/screen/auth/registration_form_page.dart';
import 'package:learning/src/presentation/screen/auth/splash_screen.dart';
import 'package:learning/src/presentation/screen/courses/course_list/course_list_screen.dart';
import 'package:learning/src/presentation/screen/courses/exercise_list/exercise_list_screen.dart';
import 'package:learning/src/presentation/screen/home/home_screen.dart';

import 'src/presentation/screen/home/home_navigation_screen.dart';
import 'src/values/bloc_observer.dart';
import 'src/values/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        AuthRepository repo = AuthRepositoryImpl(
            remoteDatasource: AuthRemoteDatasource(client: Dio()));
        return AuthBloc(
          IsSignedInWithGoogleUsecase(repository: repo),
          IsUserRegisteredUsecase(repository: repo),
          SignInWithGoogleUsecase(repository: repo),
        );
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.bluePrimary,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          Routes.splashScreen: (context) => const SplashScreen(),
          Routes.loginScreen: (context) => const LoginScreen(),
          Routes.registrationFormScreen: (context) =>
              const RegistrationFormScreen(),
          Routes.homeScreen: (context) => HomeNavigationScreen(),
          Routes.courseListScreen: (context) => const CourseListScreen(),
          Routes.exerciseListScreen: (context) => const ExerciseListScreen(),
        },
      ),
    );
  }
}
