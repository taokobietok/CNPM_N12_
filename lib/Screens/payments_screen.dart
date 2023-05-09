import 'package:flutter/material.dart';
import 'package:Clothes_ICTU/Comm/comHelper.dart';
import 'package:Clothes_ICTU/Comm/genTextFormField.dart';
import 'package:Clothes_ICTU/Screens/paymentsuccessful.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Comm/getPhoneform.dart';
import '../DatabaseHandler/DbHelper.dart';
import '../Model/UserModel.dart';

class PaymentsScreen extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<PaymentsScreen> {
  final _formKey = new GlobalKey<FormState>();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  DbHelper dbHelper;
  final _phonenumber = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conUserId = TextEditingController();
  final _conDelUserId = TextEditingController();
  final _conPassword = TextEditingController();
  // var dbHelper;
  @override
  void initState() {
    super.initState();
    // dbHelper = DbHelper();
  }
  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState(() {
      _conUserId.text = sp.getString("user_id");
      _conDelUserId.text = sp.getString("user_id");
      _conUserName.text = sp.getString("name");
      _conEmail.text = sp.getString("email");
      _conPassword.text = sp.getString("password");
    });
  }

  signUp() async {
    String uid = _phonenumber.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;

    if (_formKey.currentState.validate()) {
      if (uid.isEmpty || uname.isEmpty || email.isEmpty) {
        alertDialog(context, 'Bạn chưa nhập đủ thông tin');
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => paymentsuccesful()));
      }
    }
  }
  update() async {
    String uid = _conUserId.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String passwd = _conPassword.text;

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Đặt đơn'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // genLoginSignupHeader('Signup'),
                  SizedBox(height: 10.0),
                  getPhoneform(
                      controller: _phonenumber,
                      icon: Icons.phone,
                    hintName: 'Số điện thoại',
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conUserName,
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                      hintName: 'Họ tên'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conEmail,
                      icon: Icons.map_outlined,
                      inputType: TextInputType.streetAddress,
                      hintName: 'Địa chỉ'),
                  SizedBox(height: 10.0),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        'Đặt hàng',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: signUp,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
