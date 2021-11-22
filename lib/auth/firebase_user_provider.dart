import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LoggerFirebaseUser {
  LoggerFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

LoggerFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LoggerFirebaseUser> loggerFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<LoggerFirebaseUser>((user) => currentUser = LoggerFirebaseUser(user));
