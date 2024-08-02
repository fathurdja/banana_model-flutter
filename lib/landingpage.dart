import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Landingpage extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const Landingpage({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Image.asset(
                  'assets/images/pisangbg.jpg', // Make sure to add your image to the assets folder and update pubspec.yaml
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 240,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'APLIKASI PENGOLAHAN CITRA UNTUK MENENTUKAN KUALITAS BUAH PISANG',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Pengolahan citra kualitas buah pisang adalah proses penggunaan teknik pengolahan citra digital untuk mengukur dan menilai kualitas sarang burung walet dengan tujuan meningkatkan produksi dan nilai dari buah pisang tersebut.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 160,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: ContinuousRectangleBorder()),
                      onPressed: onButtonPressed,
                      child: Text(
                        "Start",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
