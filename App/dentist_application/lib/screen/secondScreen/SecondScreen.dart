import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ชื่อ",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "กรุณาป้อนชื่อด้วยง้บ ^^"),
                    onSaved: (fname){
                      myPatience.fname = fname.toString();
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
                    validator: RequiredValidator(errorText: "กรุณาป้อนนามสกุลด้วยง้บ T-T"),
                    onSaved: (lname){
                      myPatience.lname = lname.toString();
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            print("${myPatience.fname}");
                            print("${myPatience.lname}");
                          }
                      },
                      child: const Text("บันทึกข้อมูล",style: TextStyle(fontSize: 20),)
                      
                    ,),
                  ),
                ],
            ),
          ),
        ),
      );
  }
}
