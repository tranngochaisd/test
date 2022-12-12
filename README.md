----------object
class CaffeOject {
  final int id;
  final String name;
  final int price;
  final String description;
  final String picture;

  CaffeOject({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.picture,
  });

  CaffeOject.fromJson(Map<String, dynamic> r)
      : id = r['id'],
        name = r['name'],
        price = r['price'],
        description = r['description'],
        picture = r['picture'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'picture': picture,
    };
  }
}

---------provider

class CaffeOject {
  final int id;
  final String name;
  final int price;
  final String description;
  final String picture;

  CaffeOject({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.picture,
  });

  CaffeOject.fromJson(Map<String, dynamic> r)
      : id = r['id'],
        name = r['name'],
        price = r['price'],
        description = r['description'],
        picture = r['picture'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'picture': picture,
    };
  }
}

--------chi tiet
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


homecafe----------
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


----logincafe


import 'package:demo_ontap/homeCaffe_screen.dart';
import 'package:flutter/material.dart';

class LoginCaffe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginCaffeState();
  }
}

class LoginCaffeState extends State<LoginCaffe> {
  TextEditingController sdt = TextEditingController();
  TextEditingController mk = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(250, 250, 250, 250),
                radius: 100,
                child: Image.asset('image/logo.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 10),
              child: Text(
                "ĐĂNG NHẬP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: sdt,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Số Điện Thoại',
                      prefixIcon: Icon(Icons.phone_android),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: mk,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Mật Khẩu',
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (sdt.text.isEmpty || mk.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        icon: Icon(
                          Icons.warning_amber,
                          color: Colors.red,
                        ),
                        title: Text(
                          'THÔNG BÁO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          'Hãy nhập đầy đủ thông tin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    }),
                  );
                } else if (sdt.text.length < 10) {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        icon: Icon(
                          Icons.warning_amber,
                          color: Colors.red,
                        ),
                        title: Text(
                          'THÔNG BÁO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          'Hãy nhập đúng định dạng',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    }),
                  );
                } else if (mk.text == sdt.text) {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        icon: Icon(
                          Icons.warning_amber,
                          color: Colors.red,
                        ),
                        title: Text(
                          'THÔNG BÁO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          'Đăng nhập thành công',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeCaffe(),
                                ),
                              );
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    }),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        icon: Icon(
                          Icons.warning_amber,
                          color: Colors.red,
                        ),
                        title: Text(
                          'THÔNG BÁO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          'Đăng nhập không thành công',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    }),
                  );
                }
              },
              child: Text(
                'Đăng Nhập',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


------maincafe
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
