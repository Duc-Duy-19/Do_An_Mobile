import 'package:do_an_mobile/provider/product_provider.dart';
import 'package:do_an_mobile/screens/homepage.dart';
import 'package:do_an_mobile/widgets/importProductCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}



class _CheckoutState extends State<Checkout> {
  late ProductProvider productProvider;
  Widget _buildCheckoutDetail(
      {required String startName, required String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(startName, style: const TextStyle(fontSize: 18)),
        Text(endName, style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    double totalPrice = 0.0;
    double discount =3;
    double totalDiscount;
    double totalShipping = 10;
    double totalPayment = 0.0;
    
    productProvider.getCheckoutModelList.forEach((element) {
       totalPrice += element.price * element.quantity;
    });
    totalDiscount = totalPrice * discount / 100;
    totalPayment = totalPrice + totalShipping - totalDiscount;
    
  
     
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Thanh Toán", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  HomePage()),
              );
            },
            icon: const Icon(Icons.home, color: Colors.black),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
          ),
          child: const Text(
            "Thanh Toán",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: productProvider.getCheckOutModelListLength,
                itemBuilder: (ctx, index) {
                  return ImportProductCart(
                    isCount: false,
                    name: productProvider.getCheckoutModelList[index].name,
                    image: productProvider.getCheckoutModelList[index].image,
                    quantity: productProvider.getCheckoutModelList[index].quantity,
                    price: productProvider.getCheckoutModelList[index].price,
                    index: index,
                  );
                },
              ),
            ),
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCheckoutDetail(
                    startName: "Tổng Cộng",
                    endName: "\$  ${totalPrice.toStringAsFixed(2)}",
                  ),
                  _buildCheckoutDetail(
                    startName: "Giảm Giá", 
                    endName: " ${discount.toStringAsFixed(0)} \%"),
                  _buildCheckoutDetail(
                    startName: "Phí Vận Chuyển",
                    endName: "\$ ${totalShipping.toStringAsFixed(2)}",
                  ),
                  _buildCheckoutDetail(
                    startName: "Tổng Thanh Toán",
                    endName: "\$ ${totalPayment.toStringAsFixed(2)}",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}