import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_bar/navigation_drawer.dart';
import 'package:navigation_bar/navigation_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AdminPage()
      ),
    );
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashboards", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
        backgroundColor: Color(0xFF234D63),
      ),
    );
  }
}
