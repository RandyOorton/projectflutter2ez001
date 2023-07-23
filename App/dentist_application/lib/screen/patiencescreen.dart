import 'package:dentist_application/screen/secondScreen/SecondScreen.dart';
import 'package:flutter/material.dart';



class PatienceScreen extends StatefulWidget {
  const PatienceScreen({super.key});

  @override
  State<PatienceScreen> createState() => _PatienceScreenState();
}

class _PatienceScreenState extends State<PatienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ข้อมูลคนไข้"),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondScreen();
                  }));
                })
          ],
        ),
        body: Container(
          
        ));
  }
}
