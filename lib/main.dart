import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Movie Library',
theme: ThemeData(
primarySwatch: Colors.deepPurple,
scaffoldBackgroundColor: const Color(0xFFF5F5F5),
cardColor: Colors.white,
appBarTheme: const AppBarTheme(
backgroundColor: Colors.deepPurple,
foregroundColor: Colors.white,
centerTitle: true,
),
),
home: const HomePage(),
);
}
}
