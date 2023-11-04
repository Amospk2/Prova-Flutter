import 'package:flutter/material.dart';
import 'package:login/ui/features/home/home_page.dart';
import 'package:login/ui/features/login/login_page.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        'login': (context) => LoginPage(),
        'home': (context) => HomePage()
      },
    );
  }
}
