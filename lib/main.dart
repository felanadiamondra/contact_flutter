import 'package:flutter/material.dart';
import 'package:flutter_1/components/contact_detail.dart';
import 'package:flutter_1/components/home_page.dart';
import 'package:flutter_1/components/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.purple,
      ),
      home: const NavigationPage(),
    );
  }
}

