import 'package:flutter/material.dart';
import 'package:formularioapp/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'login',
      routes: {
        'login' :(context) => const LoginPageContext(),
        'home' :(context) => const HomePage()
      },
      theme: ThemeData.light().copyWith(
        //* Sacamos una copia y modificamos lo que necesitamos y hacemos estos estilos globales, en este todos los scaffold van tener este color
        scaffoldBackgroundColor: Colors.grey[300]
      )
    );
  }
}

