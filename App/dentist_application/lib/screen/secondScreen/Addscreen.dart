import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../model/patientdata.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  
  final formKey = GlobalKey<FormState>();
  Patient myPatient = Patient();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final fnameController = Patient();
  final lnameController = Patient();
  CollectionReference patientcollection =
      FirebaseFirestore.instance.collection("patients");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("กรอกข้อมูลผู้ป่วย"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "ชื่อ",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                validator:
                    RequiredValidator(errorText: "กรุณาป้อนชื่อด้วยง้บ ^^"),
                onSaved: (fname) {
                  myPatient.fname = fname.toString();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "นามสกุล",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                validator:
                    RequiredValidator(errorText: "กรุณาป้อนนามสกุลด้วยง้บ T-T"),
                onSaved: (lname) {
                  myPatient.lname = lname.toString();
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await patientcollection.add(
                          {"fname": myPatient.fname, "lname": myPatient.lname});
                      formKey.currentState!.reset();
                    }
                  },
                  child: const Text(
                    "บันทึกข้อมูล",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
