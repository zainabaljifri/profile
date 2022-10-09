import 'package:flutter/material.dart';
import 'package:login/login_page.dart';
import 'package:login/register_page.dart';
import 'package:login/profile.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          foregroundColor: Colors.black,
        ),
      ),
      title: 'Hello',
      routes: <String, WidgetBuilder>{
        '/': (_) => const LoginPage(), // Login Page
        // '/profile': (_) => const Profile(), // Home Page
        '/register': (_) => const RegisterPage(), // The SignUp page
      },
    );
  }
}
