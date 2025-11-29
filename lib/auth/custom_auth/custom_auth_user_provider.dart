import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class HwikAuthUser {
  HwikAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<HwikAuthUser> hwikAuthUserSubject =
    BehaviorSubject.seeded(HwikAuthUser(loggedIn: false));
Stream<HwikAuthUser> hwikAuthUserStream() =>
    hwikAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
