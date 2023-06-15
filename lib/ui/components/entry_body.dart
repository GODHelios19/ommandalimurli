import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ommandalinurli/ui/screens/vani_screen.dart';
import 'package:rive/rive.dart';

class Entry_body extends StatefulWidget {
  const Entry_body({super.key});

  @override
  State<Entry_body> createState() => _Entry_bodyState();
}

class _Entry_bodyState extends State<Entry_body> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: const SizedBox(),
          ),
        ),
        const RiveAnimation.asset(
          fit: BoxFit.cover,
          "assets/RiveAssets/shapes.riv",
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(),
          ),
        ),
        Positioned.fill(
          child: Container(
            margin: EdgeInsets.only(
                top: displayWidth * .03,
                left: displayWidth * .04,
                right: displayWidth * .04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Vani_Screen()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(displayWidth * .02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff1059c6).withOpacity(0.15),
                            blurRadius: 50.0,
                            spreadRadius: 10.0,
                            offset: const Offset(0, 40),
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 200,
                      child: const Center(child: Text("ShivBaba's Vani")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
