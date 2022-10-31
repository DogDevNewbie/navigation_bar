import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Booking Status", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
        centerTitle: true,
        backgroundColor: Color(0xFF234D63),
      ),
    );
  }
}