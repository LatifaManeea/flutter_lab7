import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final SupabaseClient supabase = Supabase.instance.client;

  /// The currently signed-in user, or `null` if nobody is signed in.
  User? get currentUser => supabase.auth.currentUser;

  /// The current auth session, or `null` if there is none.
  Session? get currentSession => supabase.auth.currentSession;

  // Email and password sign up
  Future<AuthResponse> sighupUser({
    required String email,
    required String password,
  }) {
    return supabase.auth.signUp(email: email, password: password);
  }

  // Email and password log in
  Future<AuthResponse> loginUser({
    required String email,
    required String password,
  }) {
    return supabase.auth.signInWithPassword(email: email, password: password);
  }

  // Sign the current user out
  Future<void> logoutUser() {
    return supabase.auth.signOut();
  }
}
