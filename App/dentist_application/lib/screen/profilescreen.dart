import 'dart:io';
import 'package:dentist_application/colors.dart';
import 'package:dentist_application/screen/secondScreen/option_Section.dart';
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
                              Row(
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
                              OptionsSection(),
                    ],
                  )),
            ],
          ),
        ));
  }
}
