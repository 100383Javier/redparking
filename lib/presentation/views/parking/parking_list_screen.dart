import 'package:flutter/material.dart';
import 'add_parking_screen.dart';

class ParkingListScreen extends StatelessWidget {
  const ParkingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parqueaderos")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddParkingScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.local_parking),
            title: Text("Parqueadero Centro"),
            subtitle: Text("20 cupos disponibles"),
          ),

          Divider(),

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
