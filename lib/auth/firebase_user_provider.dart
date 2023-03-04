import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PulseFirebaseUser {
  PulseFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PulseFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PulseFirebaseUser> pulseFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PulseFirebaseUser>(
      (user) {
        currentUser = PulseFirebaseUser(user);
        return currentUser!;
      },
    );
