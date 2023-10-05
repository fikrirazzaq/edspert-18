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
  final String kelas;

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
    required this.kelas,
  });

  factory UserDataEntity.fromMap(Map<String, dynamic> map) {
    return UserDataEntity(
      iduser: map['iduser'] as String,
      userName: map['user_name'] as String,
      userEmail: map['user_email'] as String,
      userFoto: map['user_foto'] as String,
      userAsalSekolah: map['user_asal_sekolah'] as String,
      dateCreate: map['date_create'] as String,
      jenjang: map['jenjang'] as String,
      userGender: map['user_gender'] as String,
      userStatus: map['user_status'] as String,
      kelas: map['kelas'] as String,
    );
  }
}
