import 'package:doan_mobile/screens/cartpage.dart';
import 'package:doan_mobile/screens/homepage.dart';
import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final String description;
   Detailpage({
    super.key,
    required this.image, 
    required this.name, 
    required this.price, 
    required this.description
  }); 
  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int count = 1;
  Widget _buildSize({required String name}){
    return Container(
      height: 60,
      width: 60,
      color: Colors.blueAccent,
      child: Center(
        child: Text(name, style: TextStyle(fontSize: 17),),
      ),
    );
  }


  final TextStyle myStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget _buildImage(){
    return Center(
      child: Container(
        width: 350,
        child: Card(
          color: Colors.grey[200],
          child: Container(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 220,
              decoration:BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(widget.image) ),
              ) ,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfProduct(){
    return Container(
      height: 200,
      color: Colors.white,
      child: Row(
        children:<Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text(widget.name, style: myStyle),
              Text("\$ ${widget.price.toString()}", style: TextStyle(fontSize: 18),),
              Text("Chi Tiết", style: myStyle),
              Text(widget.description, style: TextStyle(fontSize: 16),),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildSizes(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget> [
        Text('Size', style: myStyle,),
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildSize(name:  "S"),
              _buildSize(name:  "M"),
              _buildSize(name:  "L"),
              _buildSize(name:  "XL"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSlPart(){
    return Column(
      children: <Widget>[
        Text("Số lượng", style: myStyle,),
        SizedBox(height: 10),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              GestureDetector(
                child: Icon(Icons.remove),
                onTap: (){setState(() {
                  if(count >= 1){
                    count--;
                  }
                });},   
              ),
              Text(count.toString(), style: TextStyle(fontSize: 18),),
              GestureDetector(
                child: Icon(Icons.add),
                onTap: (){setState(() {
                  count++;
                });},
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildButton(){
    return Column(
      children:<Widget> [
        Center(
          child: Container(
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => CartPage(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price,
                    ),
                  ),
                );
              }, 
              child: Text("Thêm vào giỏ hàng"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              )),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chi tiết sản phẩm", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // Navigate to cart page
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children:<Widget> [
            _buildImage(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  _buildInfProduct(),
                   SizedBox( height: 20),
                  _buildSizes(),
                   SizedBox( height: 20),
                  _buildSlPart(),
                  SizedBox( height: 20),
                  _buildButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}