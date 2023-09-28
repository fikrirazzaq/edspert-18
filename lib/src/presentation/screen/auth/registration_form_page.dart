import 'package:flutter/material.dart';

import 'widgets/select_gender_widget.dart';
import 'widgets/widgets.dart';

class RegistrationFormScreen extends StatelessWidget {
  const RegistrationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yuk isi data diri'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputFieldWidget(
              titleText: 'Email',
              hintText: 'Email...',
              enabled: false,
              controller: TextEditingController(text: ''),
            ),
            InputFieldWidget(
              titleText: 'Nama Lengkap',
              hintText: 'contoh: Lionel Messi',
              controller: TextEditingController(),
            ),
            SelectGenderWidget(
              gender: '',
              onSelectGender: (value) {},
            ),
            DropdownButtonFormField(
              value: '10',
              items: const [
                DropdownMenuItem(value: '10', child: Text('Kelas 10')),
                DropdownMenuItem(value: '11', child: Text('Kelas 11')),
                DropdownMenuItem(value: '12', child: Text('Kelas 12')),
              ],
              onChanged: (value) {},
            ),
            InputFieldWidget(
              titleText: 'Nama Sekolah',
              hintText: 'Sekolah...',
              controller: TextEditingController(),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('DAFTAR'),
            ),
          ],
        ),
      ),
    );
  }
}
