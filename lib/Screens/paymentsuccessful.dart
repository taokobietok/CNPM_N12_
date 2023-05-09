import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:Clothes_ICTU/Screens/home_screen.dart';

class paymentsuccesful extends StatelessWidget {
  const paymentsuccesful({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Đặt hàng thành Công'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 50.0),
                // Text(
                //   'hieu',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black,
                //       fontSize: 40.0),
                // ),
                SizedBox(height: 10.0),
                Image.asset(
                  "assets/images/shipper.jpg",
                  height: 200.0,
                  width: 200.0,
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    'Chúng tôi đang giao hàng cho bạn',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                        fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      'Tiếp tục mua sắm',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                          (Route<dynamic> route) => false);
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
