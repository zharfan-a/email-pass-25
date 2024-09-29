
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/models/user_model.dart';

void main() {
	group('User Model', () {
		final validEmail = 'test@example.com';
		final validPassword = 'password123';

		test('User model should be instantiated with email and password', () {
			final user = User(email: validEmail, password: validPassword);

			expect(user.email, validEmail);
			expect(user.password, validPassword);
		});

		test('User model should have a valid toString method', () {
			final user = User(email: validEmail, password: validPassword);

			expect(user.toString(), 'User(email: $validEmail, password: $validPassword)');
		});

		test('User model should have a valid equality operator', () {
			final user1 = User(email: validEmail, password: validPassword);
			final user2 = User(email: validEmail, password: validPassword);

			expect(user1, user2);
		});

		test('User model should have a valid hashCode', () {
			final user = User(email: validEmail, password: validPassword);
			
			expect(user.hashCode, isNotNull);
		});
	});
}
