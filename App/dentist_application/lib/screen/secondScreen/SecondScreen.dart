import 'package:flutter/material.dart';

import '../../model/patiencedata.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  final formKey = GlobalKey<FormState>();
  Patience myPatience = Patience();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("กรอกข้อมูลผู้ป่วย"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ชื่อ",style: TextStyle(fontSize: 20),),
                  TextFormField(

                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("นามสกุล",style: TextStyle(fontSize: 20),),
                  TextFormField(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("บันทึกข้อมูล",style: TextStyle(fontSize: 20),)
                      
                    ,),
                  ),

                ],
            ),
          ),
        ));
  }
}
