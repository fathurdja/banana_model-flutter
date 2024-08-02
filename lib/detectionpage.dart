import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class Detectionpage extends StatefulWidget {
  const Detectionpage({super.key});

  @override
  State<Detectionpage> createState() => _DetectionpageState();
}

class _DetectionpageState extends State<Detectionpage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;
  var _recognitions;
  List<String> _labels = [];
  var v = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Hasil Deteksi ",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_image != null)
                Image.file(
                  File(_image!.path),
                  fit: BoxFit.cover,
                )
              else
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Tidak ada Gambar yang Terpilih'),
                    const SizedBox(
                        height: 400), // Space between text and buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 60,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _pickImage();
                          },
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Space to position above the bottom navigation bar
                  ],
                ),
              Center(child: Text(v))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      print('Error Mengambil Gambar: $e');
    }
  }

  Future<void> _pickImagecamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      print('Error Mengambil Gambar: $e');
    }
  }

  Future detectimage(File image) async {
    int startTime = new DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    List<String> labels =
        recognitions?.map<String>((res) => res["label"].toString()).toList() ??
            [];
    setState(() {
      _recognitions = recognitions;
      v = labels.join(", ");
      print(v);
      // dataList = List<Map<String, dynamic>>.from(jsonDecode(v));
    });
    print("//////////////////////////////////////////////////");
    print(_recognitions);
    // print(dataList);
    print("//////////////////////////////////////////////////");
    int endTime = new DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/banana_model.tflite",
      labels: "assets/labels.txt",
    );
  }
}
