
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_cubit_app/models/user_model.dart';

// AuthState definitions
abstract class AuthState extends Equatable {
	const AuthState();

	@override
	List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
	final User user;

	const AuthAuthenticated(this.user);

	@override
	List<Object> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

// AuthCubit implementation
class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		try {
			emit(AuthLoading());
			// Simulate a network call
			await Future.delayed(Duration(seconds: 2));
			final user = User(email: email, password: password);
			emit(AuthAuthenticated(user));
		} catch (e) {
			emit(AuthUnauthenticated());
		}
	}

	void logout() async {
		emit(AuthLoading());
		// Simulate a network call
		await Future.delayed(Duration(seconds: 2));
		emit(AuthUnauthenticated());
	}
}
