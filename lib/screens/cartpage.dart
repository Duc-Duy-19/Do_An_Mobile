import 'package:doan_mobile/screens/checkout.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  const CartPage({
    super.key,
    required this.price, 
    required this.name, 
    required this.image}); 
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 1;
  Widget _buildCartproduct(){
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [ 
            Row(
              children:<Widget> [
                Container(
                  height: 130,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.contain
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children:<Widget> [
                        Text(widget.name),
                        Text("Quần Áo"),
                        Text(
                          "\$ ${widget.price.toString()}",
                          style: TextStyle(color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                        ),
                          Container(
                          height: 30,
                          width: 120,
                          color: Colors.grey[200],
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
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx)=>Checkout(
                  price: widget.price, 
                  name: widget.name, 
                  image: widget.image)
              ),
            );
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
          ),
          child: Text(
            "Đi Đến Thanh Toán",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold)),
        ),
      ) ,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Giỏ Hàng", style: TextStyle(color: Colors.black),),
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
      body: ListView(
        children:<Widget> [
          _buildCartproduct(),
          _buildCartproduct(),
          _buildCartproduct(),
          _buildCartproduct(),
          _buildCartproduct(),
          _buildCartproduct(),
          _buildCartproduct(),
          _buildCartproduct(),
        ],
      )
    );
  }
}