import 'package:flutter/material.dart';
import 'package:learning/src/presentation/router/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Image.network(
                      'https://lp2m.uma.ac.id/wp-content/uploads/2021/04/modulelearning.png',
                      width: 270,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 36),
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, Routes.homeScreen);
                      },
                      child: const Text('Login With Google'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login With Apple'),
                    ),
                    const SizedBox(height: 60),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
