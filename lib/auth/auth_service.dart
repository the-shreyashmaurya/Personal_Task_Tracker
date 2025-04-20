import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // SignUp with email and password
  Future<AuthResponse> signUp(
    String email,
    String password,
    String name,
  ) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {"name": name},
    );
  }

  // Login with email and password
  Future<AuthResponse> login(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // SignOut
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Get Username
  Future<String> getUsername() async {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    String name = user!.userMetadata!["name"];
    return name;
  }
}
