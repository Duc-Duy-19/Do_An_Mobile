import 'package:doan_mobile/screens/homepage.dart';
import 'package:doan_mobile/screens/signup.dart';
import 'package:doan_mobile/widgets/changeScreens.dart';
import 'package:doan_mobile/widgets/mytextformField.dart';
import 'package:doan_mobile/widgets/passwordtextformField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/mybutton.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  String p = 
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  bool obserText = true;
  String email = "";
  String password = "";

class _LoginState extends State<Login> {
  void vaildation() async {
  final FormState? _form = _formKey.currentState;
  if (_form!.validate()) {
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Đăng nhập thành công!")),
        );
      }

      // Điều hướng sang HomePage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => HomePage()),
      );

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Lỗi: ${e.toString()}")),
        );
      }
    }
  } else {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng điền đầy đủ thông tin hợp lệ")),
      );
    }
  }
}




  Widget _buildAlllTextFormFieldsAndButton(){
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget> [
          Text('Đăng Nhập',style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold
            ),
          ),
          MyTextFormField(
              name: 'Email',
              onChanged: (value){
                setState(() {
                  email = value;
                });
              },
              validator: (value) {
              if(value!.isEmpty){
                return 'Vui lòng nhập email';
              }
              else if(!regExp.hasMatch(value)){
                return 'Email không hợp lệ';
              }
              return null;
            },
          ),
          PasswordTextFormField(
            obserText: obserText, 
            onChanged: (value){
              setState(() {
                password = value;
              });
            },
            validator: (value) {
              if(value!.isEmpty){
                return 'Vui lòng nhập mật khẩu';
              }
              else if(value.length < 8){
                return 'Mật khẩu phải lớn hơn 8 ký tự';
              }
              return null;
            }, 
            name: "Password", 
            onTap:(){
                  FocusScope.of(context).unfocus();
                  setState(() {
                    obserText = !obserText;
                  });
            },
          ),
          MyButton(
            onPressed: vaildation,
            name: "Đăng Nhập"
          ),
          ChangeScreens(
            name: "Đăng Ký", 
            whichaccount: "Chưa có tài khoản?",
            onTap: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx)=>SignUp()));
            }
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldstate,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              _buildAlllTextFormFieldsAndButton(),
            ],
          ),
        ),
      ),
    );
  }
}