import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a new user account or sign in if the user already exists
  Future<User?> createUserOrSignInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (signInError) {
      if (signInError is FirebaseAuthException && signInError.code == 'user-not-found') {
        // User doesn't exist, create a new account
        final newUserCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return newUserCredential.user;
      } else {
        print('Error creating or signing in: $signInError');
        return null;
      }
    }
  }
}
