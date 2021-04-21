import 'package:flutter/material.dart';

class DabbawalasDetails extends StatefulWidget {
  @override
  _DabbawalasDetailsState createState() => _DabbawalasDetailsState();
}

class _DabbawalasDetailsState extends State<DabbawalasDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Dabbawalas Name - Mohan Pawar"),
          Text("Dabbawalas Call - Mohan Pawar"),
        ],
      ),
    );
  }
}
