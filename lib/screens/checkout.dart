import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
    final double price;
  final String name;
  final String image;
  const Checkout({
    super.key,
    required this.price, 
    required this.name, 
    required this.image}); 
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:<Widget> [
                              Text("Tổng Cộng"),
                              Text("1")
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

  Widget _buildCheckoutDetail({required String startName,required String endName}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(startName,style:  TextStyle(fontSize: 18),),
        Text(endName, style: TextStyle(fontSize: 18),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Thanh Toán", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
          },
        ),
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: (){}, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
          ),
          child: Text(
            "Thanh Toán",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold)),
        ),
      ) ,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children:<Widget> [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                _buildCartproduct(),
                _buildCartproduct(),
                _buildCartproduct(),
                _buildCartproduct(),
                _buildCartproduct(),
                _buildCartproduct(),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      _buildCheckoutDetail(
                        startName: "Tổng Cộng",
                        endName: "\$ 50.0",
                      ),
                      _buildCheckoutDetail(
                        startName: "Giảm Giá",
                        endName: "\$ 0.0",
                      ),
                      _buildCheckoutDetail(
                        startName: "Phí Vận Chuyển",
                        endName: "\$ 0.0",
                      ),
                      _buildCheckoutDetail(
                        startName: "Tổng Thanh Toán",
                        endName: "\$ 50.0",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}