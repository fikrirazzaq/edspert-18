part of 'banner_cubit.dart';

class BannerState {}

final class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerSuccess extends BannerState {
  final BannerResponseEntity banner;

  BannerSuccess({required this.banner});
}

final class BannerError extends BannerState {
  final String errorMessage;

  BannerError({required this.errorMessage});
}
