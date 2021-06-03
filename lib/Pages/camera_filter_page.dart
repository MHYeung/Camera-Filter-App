import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import '/Model/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key key, @required this.image, @required this.filterName})
      : super(key: key);

  final File image;
  final String filterName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Filter(
        image: image,
        filterName: filterName,
      ),
    );
  }
}

class Filter extends StatefulWidget {
  const Filter({Key key, @required this.image, @required this.filterName})
      : super(key: key);

  final File image;
  final String filterName;

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  File imageFile;
  Uint8List _imageFile;

  ScreenshotController screenshotController = ScreenshotController();

  Widget filterImage(File img) {
    return ColorFiltered(
        colorFilter:
            ColorFilter.matrix(FilterModel.getFilter(widget.filterName)),
        child: Image.file(img));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<String> filePaths = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Screenshot(
                child: filterImage(widget.image),
                controller: screenshotController,
              ),
            ),
          ),
          ElevatedButton.icon(
              onPressed: () {
                _imageFile = null;
                screenshotController
                    .capture(delay: Duration(milliseconds: 10))
                    .then((Uint8List image) async {
                  _imageFile = image;
                  Directory appDirectory = await getExternalStorageDirectory();
                  String docPath = appDirectory.path;
                  String fileName = 'image_${DateTime.now()}.jpg';
                  String filePath = '$docPath/$fileName';
                  filePaths.add(filePath);
                  File file = new File(filePath);
                  file.writeAsBytesSync(_imageFile);
                  print(filePath);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        '已儲存相片至: $filePath',
                      ),
                      action: SnackBarAction(
                        label: '知道了',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      )));
                }).catchError((onError) {
                  print(onError);
                });
              },
              icon: Icon(Icons.save),
              label: Text(
                '儲存圖片',
                style: TextStyle(fontSize: 24),
              )),
          ElevatedButton.icon(
              onPressed: () async {
                print(filePaths);

                _imageFile = null;
                screenshotController
                    .capture(delay: Duration(milliseconds: 10))
                    .then((Uint8List image) async {
                  _imageFile = image;
                  Directory appDirectory = await getExternalStorageDirectory();
                  String docPath = appDirectory.path;
                  String fileName = 'image_${DateTime.now()}.jpg';
                  String filePath = '$docPath/$fileName';
                  filePaths.add(filePath);
                  File file = new File(filePath);
                  file.writeAsBytesSync(_imageFile);
                  if (filePaths.isNotEmpty) {
                    await Share.shareFiles(filePaths);
                  }
                });
              },
              icon: Icon(Icons.share),
              label: Text(
                '分享圖片',
                style: TextStyle(fontSize: 24),
              )),
          ElevatedButton.icon(onPressed: () => Navigator.popAndPushNamed(context, '/camera'), icon: Icon(Icons.refresh_rounded), label: Text(
            '重新選擇圖片',
            style: TextStyle(fontSize: 24),
          ))
        ],
      ),
    );
  }
}
