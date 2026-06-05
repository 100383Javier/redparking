import 'package:flutter/material.dart';
import '../parking/parking_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RedParking")),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.local_parking, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Administrador",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.local_parking),
              title: const Text("Parqueaderos"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ParkingListScreen(),
                  ),
                );
              },
            ),

            const ListTile(
              leading: Icon(Icons.directions_car),
              title: Text("Vehículos"),
            ),

            const ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text("Reservas"),
            ),

            const ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("Reportes"),
            ),
          ],
        ),
      ),

      body: const Center(
        child: Text(
          "Panel de Administración",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
