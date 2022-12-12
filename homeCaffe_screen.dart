import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_ontap/caffe_Object.dart';
import 'package:demo_ontap/caffe_Provider.dart';
import 'package:demo_ontap/chitietcaffe.dart';
import 'package:demo_ontap/loginCaffe_screen.dart';
import 'package:flutter/material.dart';

class HomeCaffe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeCaffeState();
  }
}

class HomeCaffeState extends State<HomeCaffe> {
  List<CaffeOject> lsCaffe = [];

  void layDanhSachCaffe() async {
    final data = await CaffeProvider.layTatCaSanPham();
    setState(() {});
    lsCaffe = data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    layDanhSachCaffe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Thực Đơn",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginCaffe(),
                  ),
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: lsCaffe.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(250, 250, 250, 250),
                  backgroundImage:
                      CachedNetworkImageProvider(lsCaffe[index].picture),
                ),
                title: Text(lsCaffe[index].name),
                subtitle: Text(lsCaffe[index].price.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChiTietCaffe(
                        caffe: lsCaffe[index],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
