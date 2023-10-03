import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/presentation/blocs/home_nav/home_nav_cubit.dart';
import 'package:learning/src/presentation/screen/home/home_screen.dart';
import 'package:learning/src/presentation/screen/profile/profile_screen.dart';

import '../../../data/datasource/banner_remote_datasource.dart';
import '../../../data/datasource/course_remote_datasource.dart';
import '../../../data/repository/banner_repository_impl.dart';
import '../../../data/repository/course_repository_impl.dart';
import '../../../domain/repository/course_repository.dart';
import '../../../domain/usecase/courses/get_courses_usecase.dart';
import '../../../domain/usecase/courses/get_exercise_result_usecase.dart';
import '../../../domain/usecase/courses/get_exercises_by_course_usecase.dart';
import '../../../domain/usecase/courses/get_questions_by_exercise_usecase.dart';
import '../../../domain/usecase/courses/submit_exercise_answer_usecase.dart';
import '../../../domain/usecase/get_banners_usecase.dart';
import '../../blocs/banner/banner_cubit.dart';
import '../../blocs/course/course_bloc.dart';

class HomeNavigationScreen extends StatelessWidget {
  HomeNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeNavCubit(),
      child: BlocBuilder<HomeNavCubit, HomeNav>(
        builder: (context, state) {
          return Scaffold(
            body: nav[state.index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Diskusi',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                context.read<HomeNavCubit>().navigateTo(HomeNav.values[index]);
              },
            ),
          );
        },
      ),
    );
  }

  final List<Widget> nav = [
    const HomeScreen(),
    const Placeholder(),
    const ProfileScreen(),
  ];
}
