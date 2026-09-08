import 'package:day12_introduction_to_database/screens/sighup_screen.dart';
import 'package:day12_introduction_to_database/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://idopcbfxcjnlwoawzooc.supabase.co",
    publishableKey: "sb_publishable_5FP5Lrg8gwtkTUdALAN-hw_X5kVNzjK",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}

/// Decides which screen to show based on the current auth state.
/// A signed-in user lands on the [WelcomeScreen]; everyone else starts
/// on the [SighupScreen].
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Supabase.instance.client.auth;

    return StreamBuilder<AuthState>(
      stream: auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = auth.currentSession;
        if (session != null) {
          return const WelcomeScreen();
        }
        return const SighupScreen();
      },
    );
  }
}
