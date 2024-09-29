
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc/bloc.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';

// Mocking dependencies
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is AuthInitial', () {
			expect(authCubit.state, equals(AuthInitial()));
		});

		blocTest<AuthCubit, AuthState>(
			'login emits [AuthLoading, AuthAuthenticated] when successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [
				AuthLoading(),
				AuthAuthenticated(User(email: 'test@example.com', password: 'password'))
			],
		);

		blocTest<AuthCubit, AuthState>(
			'logout emits [AuthLoading, AuthUnauthenticated]',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [
				AuthLoading(),
				AuthUnauthenticated()
			],
		);
	});
}
