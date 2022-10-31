import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("User", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
        centerTitle: true,
        backgroundColor: Color(0xFF234D63),
      ),
    );
  }
}