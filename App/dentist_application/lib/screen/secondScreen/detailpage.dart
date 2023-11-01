import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot patientData;

  const DetailPage({Key? key, required this.patientData}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    String fname = widget.patientData['fname'];
    String lname = widget.patientData['lname'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$fname' ' ' '$lname'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_photo_alternate),
              onPressed: () async {
                Map<Permission, PermissionStatus> statuses = await [
                  Permission.storage,
                  Permission.camera,
                ].request();
                if (statuses[Permission.storage]!.isGranted &&
                    statuses[Permission.camera]!.isGranted) {
                  showImagePicker(context);
                } else {
                  print('no permission provided');
                }
              })
        ],
      ),
    );
  }
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
                    onTap: () {
                      _imgFromGallery();
                      Navigator.pop(context);
                    },
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
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.pop(context);
                    },
                  ))
                ],
              )),
        );
      });
}

_imgFromGallery() async {
  await picker
      .pickImage(source: ImageSource.gallery, imageQuality: 50)
      .then((value) {
    if (value != null) {}
  });
}

_imgFromCamera() async {
  await picker
      .pickImage(source: ImageSource.camera, imageQuality: 50)
      .then((value) {
    if (value != null) {}
  });
}
