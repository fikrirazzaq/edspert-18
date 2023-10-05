import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/firebase_options.dart';
import 'package:learning/src/data/datasource/auth_remote_datasource.dart';
import 'package:learning/src/data/repository/auth_repository_impl.dart';
import 'package:learning/src/domain/repository/auth_repository.dart';
import 'package:learning/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:learning/src/presentation/blocs/course/exercise_form_cubit.dart';
import 'package:learning/src/presentation/router/routes.dart';
import 'package:learning/src/presentation/screen/auth/login_screen.dart';
import 'package:learning/src/presentation/screen/auth/registration_form_page.dart';
import 'package:learning/src/presentation/screen/auth/splash_screen.dart';
import 'package:learning/src/presentation/screen/courses/course_list/course_list_screen.dart';
import 'package:learning/src/presentation/screen/courses/exercise/exercise_questions_form_page.dart';
import 'package:learning/src/presentation/screen/courses/exercise/exercise_result_page.dart';
import 'package:learning/src/presentation/screen/courses/exercise_list/exercise_list_screen.dart';
import 'package:learning/src/presentation/screen/profile/edit_profile_screen.dart';

import 'src/data/datasource/banner_remote_datasource.dart';
import 'src/data/datasource/course_remote_datasource.dart';
import 'src/data/repository/banner_repository_impl.dart';
import 'src/data/repository/course_repository_impl.dart';
import 'src/domain/repository/course_repository.dart';
import 'src/domain/usecase/auth/usecases.dart';
import 'src/domain/usecase/courses/get_courses_usecase.dart';
import 'src/domain/usecase/courses/get_exercise_result_usecase.dart';
import 'src/domain/usecase/courses/get_exercises_by_course_usecase.dart';
import 'src/domain/usecase/courses/get_questions_by_exercise_usecase.dart';
import 'src/domain/usecase/courses/submit_exercise_answer_usecase.dart';
import 'src/domain/usecase/banner/get_banners_usecase.dart';
import 'src/presentation/blocs/banner/banner_cubit.dart';
import 'src/presentation/blocs/course/course_bloc.dart';
import 'src/presentation/screen/home/home_navigation_screen.dart';
import 'src/core/helpers/bloc_observer.dart';
import 'src/core/values/colors.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            AuthRepository repo = AuthRepositoryImpl(
                remoteDatasource: AuthRemoteDatasource(client: Dio()));
            return AuthBloc(
              IsSignedInWithGoogleUsecase(repository: repo),
              IsUserRegisteredUsecase(repository: repo),
              SignInWithGoogleUsecase(repository: repo),
              GetCurrentSignedInEmailUsecase(repository: repo),
              SignOutUsecase(repository: repo),
              RegisterUserUsecase(repository: repo),
              GetUserUsecase(repository: repo),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            CourseRepository repo = CourseRepositoryImpl(
              remoteDatasource: CourseRemoteDatasource(client: Dio()),
            );
            return CourseBloc(
              GetCoursesUsecase(repository: repo),
              GetExercisesByCourseUsecase(repository: repo),
              GetQuestionsByExerciseUsecase(repository: repo),
              SubmitExerciseAnswerUsecase(repository: repo),
              GetExercisesResultUsecase(repository: repo),
            );
          },
        ),
        BlocProvider(
          create: (context) => BannerCubit(
            GetBannersUsecase(
              repository: BannerRepositoryImpl(
                remoteDatasource: BannerRemoteDatasource(client: Dio()),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ExerciseFormCubit(),
        ),
      ],
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
          Routes.editProfile: (context) => const EditProfileScreen(),
          Routes.doExerciseScreen: (context) =>
              const ExerciseQuestionsFormPage(),
          Routes.exerciseResult: (context) => const ExerciseResultPage(),
        },
      ),
    );
  }
}
