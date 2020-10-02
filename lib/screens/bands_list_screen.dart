import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_fest_flutter/models/band.dart';
import 'package:music_fest_flutter/screens/band_details_screen.dart';

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
          List<Band> bands = snapshot.data;
          return bandsListView(bands);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView bandsListView(bands) {
    return ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) {
          inspect(bands[index]);
          return tile(bands[index]);
        });
  }

  ListTile tile(Band band) => ListTile(
        title: Text('${band.id} > ${band.name}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        // subtitle: Text(data.description),
        leading: Icon(
          Icons.subject,
          color: Colors.blue[500],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BandDetailsScreen(band.id, band.name),
            ),
          );
        },
      );
}
