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
