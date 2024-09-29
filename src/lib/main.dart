
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Simple Cubit App',
			home: BlocProvider(
				create: (context) => AuthCubit(),
				child: BlocBuilder<AuthCubit, AuthState>(
					builder: (context, state) {
						if (state == AuthState.authenticated) {
							return HomeScreen();
						} else {
							return LoginScreen();
						}
					},
				),
			),
		);
	}
}
