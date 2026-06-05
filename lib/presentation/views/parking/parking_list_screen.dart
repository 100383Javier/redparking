import 'package:flutter/material.dart';

class ParkingListScreen extends StatelessWidget {
  const ParkingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parqueaderos")),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.local_parking),
            title: Text("Parqueadero Centro"),
            subtitle: Text("20 cupos disponibles"),
          ),

          ListTile(
            leading: Icon(Icons.local_parking),
            title: Text("Parqueadero Norte"),
            subtitle: Text("15 cupos disponibles"),
          ),
        ],
      ),
    );
  }
}
