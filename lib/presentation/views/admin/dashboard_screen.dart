import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RedParking")),

      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
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
              leading: Icon(Icons.local_parking),
              title: Text("Parqueaderos"),
            ),

            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text("Vehículos"),
            ),

            ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text("Reservas"),
            ),

            ListTile(leading: Icon(Icons.bar_chart), title: Text("Reportes")),
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
