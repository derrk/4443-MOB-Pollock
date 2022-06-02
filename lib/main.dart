// This app is meant to learn flutter in prep
// for summer I 2022 Platform Based Mobile App Development.

import 'package:flutter/material.dart';

// The main function is the starting point for all Flutter Apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: Text('I am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
          child: Image(
          image: AssetImage('images/diamond.png')
        ),
        ),
      ),
    ),
  );
}
