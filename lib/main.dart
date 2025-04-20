import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:personal_task_tracker/app/theme.dart';
import 'package:personal_task_tracker/auth/login_screen.dart';
import 'package:personal_task_tracker/provider/task_provider.dart';
import 'package:personal_task_tracker/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    anonKey: dotenv.env["SUPABASE_URL"]!,
    url: dotenv.env["SUPABASE_ANON_KEY"]!,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme().darkTheme,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
