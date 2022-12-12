import 'package:demo_ontap/caffe_Object.dart';
import 'package:flutter/material.dart';

class ChiTietCaffe extends StatefulWidget {
  CaffeOject caffe;

  ChiTietCaffe({Key? key, required this.caffe}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChiTietCaffeState();
  }
}

class ChiTietCaffeState extends State<ChiTietCaffe> {
  @override
  Widget build(BuildContext context) {
    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Đặt Món',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                  width: 300,
                  height: 200,
                  child: Hero(
                    tag: 'productimage_${this.widget.caffe.name}',
                    child: Image.network(this.widget.caffe.picture),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.25),
            height: size.height * 0.75,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 82, 197, 250),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        this.widget.caffe.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${this.widget.caffe.price} VNĐ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                Column(
                  children: [
                    Text(
                      this.widget.caffe.description,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
