import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_fest_flutter/models/band.dart';

class BandView extends StatefulWidget {
  final int bandId;
  final String bandName;
  BandView(this.bandId, this.bandName);

  @override
  _BandViewState createState() => _BandViewState();
}

class _BandViewState extends State<BandView> {
  Future<Band> futureBand;

  @override
  void initState() {
    futureBand = Band.fetchBand(widget.bandId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.bandName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.bandName),
        ),
        body: Center(
          child: FutureBuilder<Band>(
            future: futureBand,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BandDetails(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class BandDetails extends StatelessWidget {
  final Band band;
  BandDetails(this.band);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Text(band.name),
        Text(band.description),
      ],
    );
  }
}
