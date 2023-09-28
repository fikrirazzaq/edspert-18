import 'dart:developer';

import 'package:dio/dio.dart';
import '../model/register_user_request_model.dart';
import '../model/user_response_model.dart';

class AuthRemoteDatasource {
  final Dio client;

  const AuthRemoteDatasource({required this.client});

  Future<UserResponseModel?> getUserByEmail({required String email}) async {
    try {
      const String url = 'https://edspert.widyaedu.com/users';

      final result = await client.get(
        url,
        queryParameters: {
          'email': email,
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      final userData = UserResponseModel.fromJson(result.data);

      return userData;
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return null;
    }
  }

  Future<UserResponseModel> registerUser({required RegisterUserRequestModel request}) async {
    try {
      const String url = 'https://edspert.widyaedu.com/users/registrasi';

      final result = await client.post(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
        data: request.toMap(),
      );

      final userData = UserResponseModel.fromJson(result.data);

      return userData;
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return UserResponseModel();
    }
  }
}
