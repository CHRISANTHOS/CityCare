import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:incident/viewModels/incidentReportViewModel.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_page.dart';

class IncidentReportPage extends StatefulWidget {
  @override
  State<IncidentReportPage> createState() => _IncidentReportPageState();
}

class _IncidentReportPageState extends State<IncidentReportPage> {
  IncidentReportViewModel? _incidentReportViewModel;

  final ImagePicker _picker = ImagePicker();

  void _showPhotoAlbum() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _incidentReportViewModel!.imagePath = image!.path;
    });
  }

  void _showCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CameraPage(camera: camera)));
  }

  void _fetchImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    _showCamera();
                  },
                  leading: const Icon(Icons.camera),
                  title: const Text('Take Photo'),
                ),
                ListTile(
                  onTap: () {
                    _showPhotoAlbum();
                    Navigator.of(context).pop();
                  },
                  leading: const Icon(Icons.photo_album),
                  title: const Text('Select from gallery'),
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _incidentReportViewModel =
        Provider.of<IncidentReportViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<IncidentReportViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report an incident'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                vm.imagePath == null
                    ? Image.network(
                        'https://cdn.windowsreport.com/wp-content/uploads/2020/04/Best-software-for-abstract-art.jpg')
                    : Image.file(File(vm.imagePath!)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          vm.imagePath = null;
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                )
              ],
            ),
            TextButton(
              onPressed: () {
                _fetchImage(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey)),
              child: const Text(
                'Take Photo',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextField(
              onChanged: (value) => vm.title = value,
              decoration: InputDecoration(
                labelText: 'Enter title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              onChanged: (value) => vm.description = value,
              textInputAction: TextInputAction.done,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Enter description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                vm.saveIncident();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
