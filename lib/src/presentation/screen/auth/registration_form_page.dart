import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning/src/data/model/register_user_request_model.dart';
import 'package:learning/src/presentation/blocs/auth/auth_bloc.dart';

class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationFormScreen> createState() => _RegistFormPageState();
}

class _RegistFormPageState extends State<RegistrationFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _schoolNameTextController = TextEditingController();
  String? selectedKelas;
  String jenisKelamin = '';

  bool isAllValid = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Yuk isi data diri',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text('Email'),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: context.read<AuthBloc>().getCurrentUserEmail(),
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Nama Lengkap'),
                TextFormField(
                  obscureText: true,
                  controller: _fullNameTextController,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(height: 24),
                const Text('Nama Sekolah'),
                TextFormField(
                  controller: _schoolNameTextController,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                DropdownButtonFormField(
                  value: selectedKelas,
                  items: const [
                    DropdownMenuItem(value: '10', child: Text('Kelas 10')),
                    DropdownMenuItem(value: '11', child: Text('Kelas 11')),
                    DropdownMenuItem(value: '12', child: Text('Kelas 12')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedKelas = value;
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
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedKelas != null) {
                        context.read<AuthBloc>().add(RegisterUserEvent(
                                request: RegisterUserRequestModel(
                              fullName: _fullNameTextController.text,
                              email: context.read<AuthBloc>().getCurrentUserEmail() ?? '',
                              schoolName: _schoolNameTextController.text,
                              schoolLevel: 'SMA',
                              schoolGrade: selectedKelas!,
                              gender: jenisKelamin,
                            )));
                      }
                    }
                  },
                  child: const Text('DAFTAR'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isRadioSelected({
    required String currentValue,
    required String radioValue,
  }) {
    return currentValue == radioValue;
  }
}
