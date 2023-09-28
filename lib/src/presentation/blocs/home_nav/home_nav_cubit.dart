import 'package:flutter_bloc/flutter_bloc.dart';

enum HomeNav { home, discussion, profile }

class HomeNavCubit extends Cubit<HomeNav> {
  HomeNavCubit() : super(HomeNav.home);

  void navTo(HomeNav nav) {
    emit(nav);
  }
}
