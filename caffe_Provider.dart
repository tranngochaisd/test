import 'dart:convert';
import 'dart:ffi';

import 'package:demo_ontap/caffe_Object.dart';
import 'package:flutter/services.dart';

class CaffeProvider {
  //lấy danh sách dữ liệu từ file json
  static Future<List<dynamic>> docFileJson() async {
    //dùng rootBundle để đọc file từ resource ứng dụng
    var jsonText = await rootBundle.loadString('data/ontap.json');
    //lấy dữ liêu từ json (theo cấu trúc chứa danh sách)
    var data = json.decode(jsonText);
    return data;
  }

  static Future<List<CaffeOject>> layTatCaSanPham() async {
    List<CaffeOject> lsCaffe = [];
    List<dynamic> data = await docFileJson();
    lsCaffe = data.map((e) => CaffeOject.fromJson(e)).toList();
    return lsCaffe;
  }
}
