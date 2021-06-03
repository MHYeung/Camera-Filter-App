import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_filter/Model/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File _image;
  final picker = ImagePicker();

  Future _getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(pickedFile.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  Future _getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(pickedFile.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自動濾鏡相機'),
        automaticallyImplyLeading: false,
      ),
      body: (_image != null)
          ? SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(5.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: Image.file(_image)),
                    ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  title: Center(child: const Text('請選擇濾鏡類型:',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),)),
                                  content: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.popAndPushNamed(
                                                context, '/filter',
                                                arguments: ScreenArguments(
                                                    file: _image,
                                                    filterName: 'human'));
                                          },
                                          icon: Icon(Icons.people),
                                          label: Text('人像', style: TextStyle(fontSize: 24),)),
                                      SizedBox(height: 10,),
                                      ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.popAndPushNamed(
                                                context, '/filter',
                                                arguments: ScreenArguments(
                                                    file: _image,
                                                    filterName: 'landscape'));
                                          },
                                          icon: Icon(Icons.landscape),
                                          label: Text('風景', style: TextStyle(fontSize: 24),)),
                                      SizedBox(height: 10,),
                                      ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.popAndPushNamed(
                                                context, '/filter',
                                                arguments: ScreenArguments(
                                                    file: _image,
                                                    filterName: 'others'));
                                          },
                                          icon: Icon(Icons.timeline),
                                          label: Text('其他類型', style: TextStyle(fontSize: 24),)),
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: Icon(Icons.add_photo_alternate_outlined),
                        label: Text('加入濾鏡', style: TextStyle(fontSize: 24),)),
                    ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                        icon: Icon(Icons.refresh),
                        label: Text('重新載入', style: TextStyle(fontSize: 24),)),
                  ],
                ),
              ),
            )
          : Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton.extended(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        heroTag: "camera",
                        onPressed: _getImageCamera,
                        icon: Icon(Icons.add_a_photo_outlined),
                        label: Text(
                          '相機拍攝新相片',
                          style: TextStyle(fontSize: 24),
                        )),
                    FloatingActionButton.extended(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      heroTag: "gallery",
                      onPressed: _getImageGallery,
                      icon: Icon(Icons.file_copy_rounded),
                      label: Text(
                        '從手機資料夾中選取',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ])),
    );
  }
}
