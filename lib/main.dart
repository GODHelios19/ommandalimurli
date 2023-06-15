import 'package:flutter/material.dart';
import 'package:ommandalinurli/ui/screens/splashscreen.dart';

void main() {
  runApp(const OmMandaliMurli());
}

class OmMandaliMurli extends StatelessWidget {
  const OmMandaliMurli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Om Mandali-Murli',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
