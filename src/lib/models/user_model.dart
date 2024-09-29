
class User {
	final String email;
	final String password;

	User({required this.email, required this.password});

	@override
	String toString() {
		return 'User(email: $email, password: $password)';
	}

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;
		if (runtimeType != other.runtimeType) return false;
		final User otherUser = other as User;
		return email == otherUser.email && password == otherUser.password;
	}

	@override
	int get hashCode => email.hashCode ^ password.hashCode;
}
