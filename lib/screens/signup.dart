import 'package:doan_mobile/screens/login.dart';
import 'package:doan_mobile/widgets/mybutton.dart';
import 'package:doan_mobile/widgets/mytextformField.dart';
import 'package:doan_mobile/widgets/passwordtextformField.dart';
import 'package:flutter/material.dart';
import 'package:doan_mobile/widgets/changeScreens.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final RegExp regExp = RegExp(p);
  String email = "";
  String password = ""; // Sửa "Password" thành "password" cho nhất quán
  String username = ""; // Sửa "Username" thành "username" cho nhất quán
  String sdt = ""; // Sửa "SDT" thành "sdt" cho nhất quán
  bool obserText = true;
  final String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


class _SignUpState extends State<SignUp> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();



  Future<void> validation() async { // Sửa "vaildation" thành "validation"
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Đăng ký thành công!")),
        );
        print("UID: ${result.user!.uid}");
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = "Email đã được sử dụng.";
            break;
          case 'invalid-email':
            errorMessage = "Email không hợp lệ.";
            break;
          case 'weak-password':
            errorMessage = "Mật khẩu quá yếu (ít nhất 6 ký tự).";
            break;
          case 'operation-not-allowed':
            errorMessage = "Tài khoản email/mật khẩu bị vô hiệu hóa.";
            break;
          default:
            errorMessage = "Lỗi: ${e.message}";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Lỗi không xác định: $e")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng điền đầy đủ thông tin hợp lệ")),
      );
    }
  }

  Widget _buildAllTextFormFields() {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: 'Email',
            onChanged: (value) {
              setState(() {
                email = value; // Gán value cho email
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Vui lòng nhập email';
              } else if (!regExp.hasMatch(value)) {
                return 'Email không hợp lệ';
              }
              return null;
            },
          ),
          MyTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Username không được để trống";
              } else if (value.length < 6) {
                return "Username phải lớn hơn 6 ký tự";
              }
              return null;
            },
            name: "Username",
            onChanged: (value) {
              setState(() {
                username = value; // Gán value cho username
              });
            },
          ),
          PasswordTextFormField(
            obserText: obserText,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Vui lòng nhập mật khẩu';
              } else if (value.length < 8) {
                return 'Mật khẩu phải lớn hơn 8 ký tự';
              }
              return null;
            },
            name: "Password",
            onChanged: (value) {
              setState(() {
                password = value; // Gán value cho password
              });
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          MyTextFormField(
            name: "SDT",
            onChanged: (value) {
              setState(() {
                sdt = value; // Gán value cho sdt
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "SDT không được để trống";
              } else if (value.length != 10) {
                return "SDT phải có đúng 10 số";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormFields(),
          MyButton(onPressed: validation, name: "Đăng Ký"),
          ChangeScreens(
            name: "Đăng Nhập",
            whichaccount: "Bạn đã có tài khoản?",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) =>  Login()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldstate,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Đăng Ký',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}