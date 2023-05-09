import 'package:flutter/material.dart';
import 'package:Clothes_ICTU/Comm/comHelper.dart';
import 'package:Clothes_ICTU/Comm/genLoginSignupHeader.dart';
import 'package:Clothes_ICTU/Comm/genTextFormField.dart';
import 'package:Clothes_ICTU/DatabaseHandler/DbHelper.dart';
import 'package:Clothes_ICTU/Model/UserModel.dart';
import 'package:Clothes_ICTU/Screens/SignupForm.dart';
import 'package:Clothes_ICTU/Screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeForm.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uid = _conUserId.text;
    String passwd = _conPassword.text;

    if (uid.isEmpty) {
      alertDialog(context, "Hãy nhập Username");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Hãy nhập Password");
    } else {
      await dbHelper.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            alertDialog(context, 'Đăng nhập thành công');
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
                (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Tài khoản hoạc mật khẩu không đúng");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Không đăng nhập được");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_id", user.user_id);
    sp.setString("user_name", user.user_name);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Đăng nhập'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Login'),
                getTextFormField(
                    controller: _conUserId,
                    icon: Icons.person,
                    hintName: 'User Name'),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                  hintName: 'Password',
                  isObscureText: true,
                ),
                Container(
                  // color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    // color: Theme.of(context).primaryColor,
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: login,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Bạn chưa có tài khoản ?'),
                      TextButton(
                        style: TextButton.styleFrom(primary: Colors.blue),
                        child: Text('Đăng kí'),
                        onPressed: () {
                          // alertDialog(context,
                          //           'Đăng nhập thành công');

                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignupForm()));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
