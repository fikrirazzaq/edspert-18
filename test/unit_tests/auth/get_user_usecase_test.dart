import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/repository/auth_repository_impl.dart';
import 'package:learning/src/domain/entity/user_response_entity.dart';
import 'package:learning/src/domain/usecase/auth/get_user_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepositoryImpl>()])
void main() {
  late GetUserUsecase getUserUsecase;
  late MockAuthRepositoryImpl authRepository;

  // Preparations
  setUp(() {
    authRepository = MockAuthRepositoryImpl();
    getUserUsecase = GetUserUsecase(repository: authRepository);
  });

  UserDataEntity exampleSuccessData = UserDataEntity.fromMap({
    "iduser": "71091",
    "user_name": "Edufren",
    "user_email": "alitopan@widyaedu.com",
    "user_foto":
        "https://api.widyaedu.com/assets/uploads/avatar/5a57317764486c77636d396d6157786c_emptyprofile.png",
    "user_asal_sekolah": "SMA NEGERI 1 MEULABOH",
    "date_create": "2022-02-24 08:28:55",
    "jenjang": "SMA",
    "user_gender": "Laki-laki",
    "user_status": "verified",
    "kelas": "12"
  });

  /// Test Script
  test('Get User Usecase', () async {
    /// Arrange
    when(authRepository.getUserByEmail(email: anyNamed('email')))
        .thenAnswer((realInvocation) async => exampleSuccessData);

    /// Act(ion)
    final result = await getUserUsecase('fikri@gmail.com');

    /// Assert
    expect(result, exampleSuccessData);
    verify(await authRepository.getUserByEmail(email: 'fikri@gmail.com'));
    verifyNoMoreInteractions(authRepository);
  });
}
