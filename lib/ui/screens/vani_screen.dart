import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ommandalinurli/api/apis/date_api.dart';
import 'package:ommandalinurli/api/models/datamodel_shiv.dart';
import 'package:rive/rive.dart';

import '../components/bottom_nav.dart';
import '../components/months.dart';

class Vani_Screen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  get displayWidth => null;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 240, 237, 237),

      //=======================Appbar=================================//

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Onmandli',
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
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                "Select",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Month & Year",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildListDelegate(
                  children: List<Widget>.generate(
                    months.length,
                    (index) => Text(
                      months[index],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashFactory: InkRipple.splashFactory,
              customBorder: const StadiumBorder(),
              splashColor: Colors.white,
              child: const Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Go",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      //==================================Body===========================//
      body: Stack(
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
                child: FutureBuilder<List<DataModelShiv>>(
                  future: DateApi.fetchDates(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error : ${snapshot.error}'),
                      );
                    } else {
                      final dates = snapshot.data!;
                      return ListView.builder(
                        itemCount: dates.length,
                        itemBuilder: (context, index) {
                          final date = dates[index];
                          return ListTile(
                            title: Text('date.data'),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      //=================================Nav-Bar=====================//
      bottomNavigationBar: const Bottom_Nav(),
    );
  }
}

final List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

List<int> years = [2017, 2018, 2019, 2020, 1021, 2022, 2023];
