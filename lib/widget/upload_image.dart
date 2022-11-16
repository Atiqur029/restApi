import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final _picker = ImagePicker();
  bool showSpiner = false;
  Future getimage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {}
  }

  Future uploadImage() async {
    setState(() {
      showSpiner = true;
    });

    var stream;
    var length;
    if (image != null) {
      stream = http.ByteStream(image!.openRead());
      length = await image!.length();
    }

    stream.cast();

    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = http.MultipartRequest('POST', uri);
    request.fields['title'] = "Static title";
    var multiport = http.MultipartFile('image', stream, length);
    request.files.add(multiport);
    var response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        showSpiner = false;
      });
      print('image uploaded');
    } else {
      print('failed');
      setState(() {
        showSpiner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpiner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getimage();
              },
              child: Container(
                child: image == null
                    ? const Center(
                        child: Text('Pick Image'),
                      )
                    : SizedBox(
                        child: Center(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: const Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
