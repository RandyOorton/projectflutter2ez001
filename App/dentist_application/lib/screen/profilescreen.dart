import 'dart:io';
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
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("หน้าโปรไฟล์"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            imageFile == null
                ? Image.asset(
                    'assets/no_profile_image.png',
                    height: 150.0,
                    width: 150.0,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(150.0),
                    child: Image.file(
                      imageFile!,
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.fill,
                    )),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () async {
                Map<Permission, PermissionStatus> statuses = await [
                  Permission.camera,
                ].request();
                if (statuses[Permission.camera]!.isGranted) {
                  showImagePicker(context);
                } else {
                  print('no permission provided');
                }
                PermissionStatus camerastatus =
                    await Permission.camera.request();

                if (camerastatus == PermissionStatus.granted) {}
                if (camerastatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("This permission is recommended.")));
                }
                if (camerastatus == PermissionStatus.permanentlyDenied) {
                  openAppSettings();
                }
              },
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    ));
  }

  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: const Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: ()=> getImage(source: ImageSource.gallery),
                    )),
                    Expanded(
                        child: InkWell(
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 60.0,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      onTap: ()=> getImage(source: ImageSource.camera),
                    ))
                  ],
                )),
          );
        });
  }

  void getImage({required ImageSource source}) async{

    final file = await ImagePicker().pickImage(source: source);

    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
