import 'package:flutter/material.dart';
import 'package:music_fest_flutter/constants.dart';
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
          backgroundColor: kColor5,
        ),
        body: Center(child: BandsListView()),
        //body: Center(child: BandDetailsScreen(28, 'Pink Floyd')), //<<<<<< replace with vars
      ),
    );
  }
}
