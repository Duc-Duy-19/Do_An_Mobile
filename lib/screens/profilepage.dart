import 'dart:math';

import 'package:do_an_mobile/model/usermodel.dart';
import 'package:do_an_mobile/provider/product_provider.dart';
import 'package:do_an_mobile/screens/homepage.dart';
import 'package:do_an_mobile/widgets/mybutton.dart';
import 'package:do_an_mobile/widgets/mytextformField.dart';
import 'package:do_an_mobile/widgets/noficationShoppingcart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProFilePage extends StatefulWidget {
   ProFilePage({super.key});

  @override
  State<ProFilePage> createState() => _ProFilePageState();
}
class _ProFilePageState extends State<ProFilePage> {
  ProductProvider productProvider = ProductProvider();
  Widget _buildImportContainer({required  String startText,required  String endText}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[100],
            borderRadius: BorderRadius.circular(20)
        ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            startText, 
            style: TextStyle(
              fontSize: 17,
              color: Colors.black45,
            ),
          ),
           Text(
            endText, 
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildMytextFomrField({required String name}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        contentPadding:   EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  } 

  bool edit = false;

  Widget _buildContainerProfilePart(){
     final productProvider = Provider.of<ProductProvider>(context);
     List<UserModel> userModel = productProvider.UsermodeList;
    return Column(
      children: userModel.map((e){
        return Column(
          children: [
            _buildImportContainer(
              startText: "Họ và tên",
              endText: e.username,
            ),
            _buildImportContainer(
              startText: "Email",
              endText: e.email,
            ),
            _buildImportContainer(
              startText: e.gioitinh,
              endText: "Nam",
            ),
            _buildImportContainer(
              startText: "Số điện thoại",
              endText: e.phone,
            ),
          ],
        );
      }).toList(),

    );
  }

   Widget _buildtextfromfileProfilePart(){
     final productProvider = Provider.of<ProductProvider>(context);
     List<UserModel> userModel = productProvider.UsermodeList;
    return Column(
      children: userModel.map((e){
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMytextFomrField(name: e.username),
            _buildMytextFomrField(name: e.email),
            _buildMytextFomrField(name: e.gioitinh),
            _buildMytextFomrField(name: e.phone),
          ],
        );
      }).toList(),

    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white ,
      appBar: AppBar(
        leading: edit == true? IconButton(
          onPressed: (){
            setState(() {
              edit = false;
            });
          }, 
          icon: Icon(Icons.close, color: Colors.red,size: 30,)
        ):
        IconButton(
          onPressed: (){
            setState(() {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            });
          }, 
          icon: Icon(Icons.arrow_back, color: Colors.black,size: 30,)
        ),
        backgroundColor: Colors.grey[200],
        actions: [
          edit ==false? NoficationShoppingCart():
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.check, color: Colors.green, size: 30,)),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 65,
                        backgroundImage: AssetImage('images/hinhuser.jpg'),
                      )
                    ],
                  ),
                ),
                edit == true? Padding(
                  padding: const EdgeInsets.only(top: 100, left: 220),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CircleAvatar(
                       backgroundColor: Colors.blue,
                      child: Icon(Icons.edit, color: Colors.white,),
                    ),
                  ),
                ):Container()
              ],
            ),
            Container(
              height:350,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 300,
                    child: edit == true?_buildtextfromfileProfilePart() :_buildContainerProfilePart()
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 200,
                child: edit == false? MyButton(
                  onPressed: (){
                    setState(() {
                      edit = true;
                    });
                  }, 
                  name: "Edit",
                ):Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}