import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_fest_flutter/models/band.dart';

class BandsListView extends StatefulWidget {
  @override
  _BandsListViewState createState() => _BandsListViewState();
}

class _BandsListViewState extends State<BandsListView> {
  Future<List<Band>> futureBands;

  @override
  void initState() {
    futureBands = Band.fetchBands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Band>>(
      future: futureBands,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Band> data = snapshot.data;
          return bandsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView bandsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          inspect(data[index]);
          return tile(data[index], Icons.subject);
        });
  }

  ListTile tile(dynamic data, IconData icon) => ListTile(
        title: Text('${data.id} > ${data.name}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(data.description),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
}
