import 'package:flutter/material.dart';

class MyYears extends StatelessWidget {
  List<int> years = [2017, 2018, 2019, 2020, 1021, 2022, 2023];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Text(
          years.toString(),
        ),
      ),
    );
  }
}
