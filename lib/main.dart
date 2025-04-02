import 'package:doan_mobile/provider/category_provider.dart';
import 'package:doan_mobile/provider/product_provider.dart';
import 'package:doan_mobile/screens/cartpage.dart';
import 'package:doan_mobile/screens/checkout.dart';
import 'package:doan_mobile/screens/detailpage.dart';
import 'package:doan_mobile/screens/homepage.dart';
import 'package:doan_mobile/screens/listproduct.dart';
import 'package:doan_mobile/screens/login.dart';
import 'package:doan_mobile/screens/welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doan_mobile/screens/signup.dart'; 
import 'package:firebase_core/firebase_core.dart'; // Import firebase_core
import 'package:provider/provider.dart';
import 'firebase_options.dart';// Import file SignUp

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo binding được khởi tạo
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseAuth.instance.signOut();
  runApp(const MyApp()); // Chạy ứng dụng
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ListenableProvider<CategoryProvider>(
            create: (ctx) => CategoryProvider(),
          ),
          ListenableProvider<ProductProvider>(
            create: (ctx) => ProductProvider(),
          ),
        ],
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(), 
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return HomePage(); // Nếu đã đăng nhập, chuyển đến trang chính
            } else {
              return Login(); // Nếu chưa đăng nhập, chuyển đến trang chào mừng
            }
          }),
      ),
    );
  }
}
