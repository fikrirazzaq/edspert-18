import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../router/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    print('initState: ProfileScreen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
        actions: [
          IconButton(
              onPressed: () async {
                await context.read<AuthBloc>().signOut();
                Navigator.pushReplacementNamed(context, Routes.loginScreen);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: ListView(
        children: [
          Text('Name:'),
        ],
      ),
    );
  }
}
