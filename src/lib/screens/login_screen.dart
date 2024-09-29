
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
	const LoginScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final TextEditingController emailController = TextEditingController();
		final TextEditingController passwordController = TextEditingController();

		return Scaffold(
			appBar: AppBar(
				title: const Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						TextField(
							controller: emailController,
							decoration: const InputDecoration(
								labelText: 'Email',
							),
							keyboardType: TextInputType.emailAddress,
						),
						const SizedBox(height: 16.0),
						TextField(
							controller: passwordController,
							decoration: const InputDecoration(
								labelText: 'Password',
							),
							obscureText: true,
						),
						const SizedBox(height: 24.0),
						ElevatedButton(
							onPressed: () {
								final String email = emailController.text;
								final String password = passwordController.text;
								context.read<AuthCubit>().login(email, password);
							},
							child: const Text('Login'),
						),
					],
				),
			),
		);
	}
}
