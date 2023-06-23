import 'package:flutter/material.dart';
import 'package:ommandalinurli/ui/components/bottom_nav.dart';
import 'package:ommandalinurli/ui/components/entry_body.dart';

class Entry_point extends StatefulWidget {
  const Entry_point({super.key});

  @override
  State<Entry_point> createState() => _Entry_pointState();
}

class _Entry_pointState extends State<Entry_point> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 240, 237, 237),

      //=======================Appbar=================================//

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Om mandali',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              // Perform dark mode logic
            },
          ),
        ],
      ),
      //==================================Body===========================//
      body: const Entry_body(),
      //=================================Nav-Bar=====================//
      bottomNavigationBar: const Bottom_Nav(),
    );
  }
}
