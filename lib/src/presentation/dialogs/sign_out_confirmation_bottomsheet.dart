import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';

class SignOutConfirmationBottomSheet {
  static void show(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => const SignOutConfirmationDialogWidget(),
    );
  }
}

class SignOutConfirmationDialogWidget extends StatelessWidget {
  const SignOutConfirmationDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Apakah Anda yakin akan keluar?'),
        Row(
          children: [
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignOutEvent());
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
          ],
        )
      ],
    );
  }
}
