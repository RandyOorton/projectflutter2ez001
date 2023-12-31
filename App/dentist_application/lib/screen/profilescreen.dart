import 'dart:io';
import 'package:dentist_application/colors.dart';
import 'package:dentist_application/screen/patientscreen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  

  @override
  State<ProfileScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<ProfileScreen> {
  File? imageFile;
  List imgList = [
    'Patient',
    'About',
    'News',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xFFD9E4EE),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [pColor.withOpacity(0.8), pColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                        'assets/dental-associate-job-1170x780.jpg'),
                                  ),
                                  Icon(Icons.notifications_outlined,
                                      color: wColor, size: 30),
                                ],
                              ),
                              SizedBox(height: 30),
                              Text(
                                "Dr.Cristiano Ronaldo",
                                style: TextStyle(
                                  color: wColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                "Let me take care\nyour time",
                                style: TextStyle(
                                  color: wColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                width: MediaQuery.of(context).size.width,
                                height: 55,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: wColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: sdColor,
                                        blurRadius: 6,
                                        spreadRadius: 3,
                                      ),
                                    ]),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search here...",
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Menu",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: bColor.withOpacity(0.7),
                              ))),
                      GridView.builder(
                        itemCount: imgList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (MediaQuery.of(context).size.height - 50 - 25) /
                                  (4 * 240),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PatientScreen(imgList[index]),
                                ));
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical:20,horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFF5F3FF),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset("assets/${imgList[index]}.png",
                                        width: 100,
                                        height: 100,
                                        ),
                                        ),
                                        SizedBox(height: 30,),
                                        Text(
                                          imgList[index],
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          )),
                                    ],
                                  )));
                        },
                      )

                      //OptionsSection(),
                    ],
                  )),
            ],
          ),
        ));
  }
}
