import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning/src/domain/entity/user_response_entity.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _sekolahController = TextEditingController();

  late String jenisKelamin;
  late String kelas;
  late String email;
  String? photoUrl;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final dynamic args = ModalRoute.of(context)?.settings.arguments;
      if (args is UserDataEntity) {
        print('args: ${args.kelas}');

        setState(() {
          _sekolahController.text = args.userAsalSekolah;
          _nameController.text = args.userName;
          jenisKelamin = args.userGender;
          kelas = args.kelas;
          email = args.userEmail;
          photoUrl = args.userFoto;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Akun'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () async {
              XFile? imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (imagePicker != null) {
                /// TODO: Pindahkan ke button UPDATE
                Uint8List? file = await imagePicker.readAsBytes();
                // Create a storage reference from our app
                final profilePictureRef = FirebaseStorage.instance.ref(
                  'pictures/${email}_pic_${DateTime.now().millisecondsSinceEpoch}.jpg',
                );
                try {
                  // Upload raw data.
                  await profilePictureRef.putData(file);
                  String url = await profilePictureRef.getDownloadURL();
                  print('url download: ${url}');
                  setState(() {
                    photoUrl = url;
                  });
                } on FirebaseException catch (e) {
                  print('Err upload $e');
                  // ...
                }
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                photoUrl ?? '',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: TextEditingController(text: email),
            enabled: false,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(6),
            ]),
          ),
          TextFormField(
            controller: _nameController,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(6),
            ]),
          ),
          TextFormField(
            controller: _sekolahController,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(6),
            ]),
          ),
          DropdownButtonFormField(
            value: kelas,
            items: const [
              DropdownMenuItem(value: '10', child: Text('Kelas 10')),
              DropdownMenuItem(value: '11', child: Text('Kelas 11')),
              DropdownMenuItem(value: '12', child: Text('Kelas 12')),
            ],
            onChanged: (value) {
              setState(() {
                kelas = value!;
              });
            },
          ),
          Row(
            children: [
              Expanded(
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        jenisKelamin = 'Laki-laki';
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: jenisKelamin == 'Laki-laki' ? Colors.blue.withOpacity(0.7) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFFD6D6D6)),
                      ),
                      child: Text(
                        'Laki-laki',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      jenisKelamin = 'Perempuan';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: jenisKelamin == 'Perempuan' ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFD6D6D6),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'Perempuan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isRadioSelected(
                          currentValue: jenisKelamin,
                          radioValue: 'Laki-laki',
                        )
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool isRadioSelected({
    required String currentValue,
    required String radioValue,
  }) {
    return currentValue == radioValue;
  }
}
