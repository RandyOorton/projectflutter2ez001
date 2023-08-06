import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final DocumentSnapshot patientData;

  const DetailPage({Key? key,required this.patientData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fname = patientData['fname'];
    String lname = patientData['lname'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$fname'+' '+'$lname'),
        
      ),
      
    );
  }
}
