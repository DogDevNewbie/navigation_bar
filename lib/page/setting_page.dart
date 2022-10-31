import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Settings", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
        centerTitle: true,
        backgroundColor: Color(0xFF234D63),
      ),
    );
  }
}