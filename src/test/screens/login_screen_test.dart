
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/screens/login_screen.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		testWidgets('should display email and password text fields and login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => authCubit,
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2)); // email and password fields
			expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
		});

		testWidgets('should call login method when login button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => authCubit,
						child: LoginScreen(),
					),
				),
			);

			await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
			await tester.enterText(find.byType(TextField).at(1), 'password123');
			await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));

			verify(() => authCubit.login('test@example.com', 'password123')).called(1);
		});
	});
}
