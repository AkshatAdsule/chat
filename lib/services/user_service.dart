import 'package:chat/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserService {
  UserService() {
    auth.FirebaseAuth.instance.authStateChanges().listen((event) {});
  }

  void _authListener(auth.User? user) {
    if (user != null) {}
  }

  User? loggedInUser;

  bool isLoggedIn() {
    return loggedInUser != null;
  }
}
