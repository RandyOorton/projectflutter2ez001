import 'package:dentist_application/screen/patiencescreen.dart';
import 'package:flutter/material.dart';
import 'screen/profilescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
      return const DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [
              ProfileScreen(),
              PatienceScreen()
            ],
            ),
            backgroundColor: Colors.blue,
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(text: "หน้าโปรไฟล์",),
                Tab(text: "รายชื่อคนไข้",)
              ],
              ),
        ),
      );
  }
}
