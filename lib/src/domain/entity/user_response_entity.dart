class UserResponseEntity {
  final int status;
  final String message;
  final UserDataEntity data;

  UserResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class UserDataEntity {
  final String iduser;
  final String userName;
  final String userEmail;
  final String userFoto;
  final String userAsalSekolah;
  final String dateCreate;
  final String jenjang;
  final String userGender;
  final String userStatus;

  UserDataEntity({
    required this.iduser,
    required this.userName,
    required this.userEmail,
    required this.userFoto,
    required this.userAsalSekolah,
    required this.dateCreate,
    required this.jenjang,
    required this.userGender,
    required this.userStatus,
  });
}
