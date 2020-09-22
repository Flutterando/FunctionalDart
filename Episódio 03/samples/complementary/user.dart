import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

/// An active session on our application.
class Session {
  final String sessionId;
  final User user;

  const Session._({
    required this.sessionId,
    required this.user,
  });
}

/// A system use.
class User {
  final int id;
  final String name;
  final Option<String> email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });
}

/// Returns the active [Session].
///
/// If there's no session (the user is not logged), [None] is returned.
Option<Session> getSession() => Some(
      Session._(
        sessionId: Uuid().v4(),
        user: const User(
          id: 0,
          name: 'Little D.',
          email: Some('little@d.com'),
        ),
      ),
    );

/// Returns the active [Session].
///
/// If there's no session (the user is not logged), `null` is returned.
Session? getSessionUnsafe() => null;

