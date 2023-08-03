
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentist_application/model/patientdata.dart';
import 'package:dentist_application/screen/secondScreen/Addscreen.dart';
import 'package:flutter/material.dart';



class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ข้อมูลคนไข้"),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondScreen();
                  }));
                })
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("patients").snapshots(),
          builder:(context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }
            return ListView(
                children: snapshot.data!.docs.map((document){
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal:5),
                    child: ListTile(
                      title: Text(document["fname"]+" "+document["lname"]),
                      onTap: () {
                        
                      },
                    ),
                    
                  );
                }).toList(),
            );
          },
        ),
        );
  }
}
