import 'package:do_an_mobile/screens/cartpage.dart';
import 'package:do_an_mobile/screens/homepage.dart';
import 'package:do_an_mobile/widgets/noficationShoppingcart.dart';
import 'package:flutter/material.dart';
import 'package:do_an_mobile/provider/product_provider.dart';
import 'package:provider/provider.dart';

class Detailpage extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final String description;

  const Detailpage({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int count = 1;

  late ProductProvider productProvider;

  Widget _buildSize({required String name}) {
    return Container(
      height: 60,
      width: 60,
      color: Colors.blueAccent,
      child: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  final TextStyle myStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget _buildImage() {
    return Center(
      child: Container(
        width: 350,
        child: Card(
          color: Colors.grey[200],
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfProduct() {
    String formattedDescription = widget.description.replaceAll('\\n', '\n');

    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.name, style: myStyle),
          const SizedBox(height: 5),
          Text("\$ ${widget.price.toString()}",
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Text("Chi Tiết", style: myStyle),
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: formattedDescription
                .split('\n')
                .map((line) => Text(line, style: const TextStyle(fontSize: 16)))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSizes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Size', style: myStyle),
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildSize(name: "S"),
              _buildSize(name: "M"),
              _buildSize(name: "L"),
              _buildSize(name: "XL"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSlPart() {
    return Column(
      children: <Widget>[
        Text("Số lượng", style: myStyle),
        const SizedBox(height: 10),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: const Icon(Icons.remove),
                onTap: () {
                  setState(() {
                    if (count >= 1) {
                      count--;
                    }
                  });
                },
              ),
              Text(count.toString(), style: const TextStyle(fontSize: 18)),
              GestureDetector(
                child: const Icon(Icons.add),
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                productProvider.addNotificationShoppingCart(
                    " Thêm vào giỏ hàng thành công");
                productProvider.addNotificationShoppingCart(
                    "Sản phẩm ${widget.name} đã được thêm vào giỏ hàng");
                productProvider.getCheckOutCartData(
                  name: widget.name,
                  image: widget.image,
                  quantity: count, // Sửa quentity thành quantity
                  price: widget.price,
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const CartPage(),
                  ),
                );
              },
              child: const Text("Thêm vào giỏ hàng"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Chi tiết sản phẩm",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const <Widget>[
          NoficationShoppingCart(),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _buildImage(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildInfProduct(),
                  const SizedBox(height: 20),
                  _buildSizes(),
                  const SizedBox(height: 20),
                  _buildSlPart(),
                  const SizedBox(height: 20),
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