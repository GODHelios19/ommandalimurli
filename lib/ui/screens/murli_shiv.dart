import 'package:flutter/material.dart';
import 'package:ommandalinurli/api/models/datamodel_shiv.dart';

import '../../api/apis/date_api.dart';

class Murli_shiv extends StatefulWidget {
  const Murli_shiv({super.key});

  @override
  State<Murli_shiv> createState() => _Murli_shivState();
}

class _Murli_shivState extends State<Murli_shiv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Murli'),
      ),
      body: FutureBuilder<List<DataModelShiv>>(
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
    );
  }
}
