import 'package:flutter/material.dart';
import 'package:tiket_wisata/constants/color.dart';
import 'package:tiket_wisata/pages/login_form.dart';
import 'package:tiket_wisata/pages/main_page.dart';
import 'package:tiket_wisata/pages/splash_screen.dart';
import 'package:tiket_wisata/pages/order_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiket Wisata',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginForm(),
        '/mainpage': (context) => MainPage(),
        '/order': (context) => OrderPage(), // Tambahkan OrderPage ke routes
      },
    );
  }
}
