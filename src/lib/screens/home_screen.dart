
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home'),
			),
			body: Center(
				child: ElevatedButton(
					onPressed: () {
						context.read<AuthCubit>().logout();
					},
					child: Text('Logout'),
				),
			),
		);
	}
}
