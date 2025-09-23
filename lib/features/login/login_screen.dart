import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/features/login/controller/login_controller.dart';
import 'package:flutter_boilerplate/features/login/state/login_state.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(loginControllerProvider);
    if (authState is LoginAuthenticatedState) {
      //Navigate to home screen
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
                _buildLoginForm(context, ref),
              if (authState is LoginLoadingState)
                Container(
                  color: Colors.black.withValues(alpha: 0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (authState is LoginErrorState)
                Container(
                  color: Colors.black.withValues(alpha: 0.5),
                  child: Center(
                    child: Text(authState.message),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(
      children: [
        const Icon(
          Icons.lock,
          size: 64,
          color: Colors.blue,
        ),
        const SizedBox(height: 24),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            ref.read(loginControllerProvider.notifier).login(
                  emailController.text,
                  passwordController.text,
                );
          },
          child: const Text('Sign In'),
        ),
      ],
    );
  }
} 