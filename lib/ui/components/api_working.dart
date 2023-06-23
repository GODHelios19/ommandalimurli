import 'package:flutter/material.dart';
import 'package:ommandalinurli/api/apis/DateApi.dart';
import '../../api/apis/constant/Constant.dart';
import '../../api/model/DateModel.dart';

class Api_working extends StatefulWidget {
  const Api_working({super.key});

  @override
  State<Api_working> createState() => _Api_workingState();
}

class _Api_workingState extends State<Api_working> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DateModel>(
      future: DateApi.fetchDates(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final users = snapshot.data!;
          lastValue = users.data[users.data.length - 1];
          lastValue = lastValue.toString().substring(0, lastValue.length - 14);
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                final user = users.data[index];
                return ListTile(
                  title: Text(lastValue),
                );
              });
        }
      },
    );
  }
}
