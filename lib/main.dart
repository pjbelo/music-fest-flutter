import 'package:flutter/material.dart';
import 'screens/bands_list_screen.dart';
import 'screens/band_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Festival',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Music Festival'),
        ),
        //body: Center(child: BandsListView()),
        body: Center(
            child: BandView(28, 'Pink Floyd')), //<<<<<< replace with vars
      ),
    );
  }
}
