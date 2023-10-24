import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2020130027/HomeScreen.dart';
import 'package:uts_2020130027/produk_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProdukProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
