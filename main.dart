import 'package:demo_ontap/chitietcaffe.dart';
import 'package:demo_ontap/homeCaffe_screen.dart';
import 'package:demo_ontap/loginCaffe_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Caffe());
}

class Caffe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Caffe Kim Sơn",
      debugShowCheckedModeBanner: false,
      home: HomeCaffe(),
    );
  }
}
