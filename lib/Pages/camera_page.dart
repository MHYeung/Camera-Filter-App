import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  File? _image;
  final picker = ImagePicker();

  Future _getImageGallery() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile!=null){
        _image = File(pickedFile.path);
      }else{
        print('No Image Selected');
      }
    });
  }

  Future _getImageCamera() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if(pickedFile!=null){
        _image = File(pickedFile.path);
      }else{
        print('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => Navigator.popAndPushNamed(context, '/home'),),
      ),
      //body: Center(
      //  child: Image.file(_image!),
      //),
      body: Column(
        children: [
          if (_image!= null) Image.file(_image!),
          Text('Filter it!')
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "camera",
            onPressed: _getImageCamera,
            child: Icon(Icons.camera),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            heroTag: "gallery",
            onPressed: _getImageGallery,
            child: Icon(Icons.book),
          ),
        ],
      ),
    );
  }
}


