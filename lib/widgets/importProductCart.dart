import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:do_an_mobile/provider/product_provider.dart';

class ImportProductCart extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final bool isCount;
  final int quantity; // Sửa quentity thành quantity
  final int index;

  const ImportProductCart({
    super.key,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.index,
    this.isCount = true,
  });

  @override
  State<ImportProductCart> createState() => _ImportProductCartState();
}

class _ImportProductCartState extends State<ImportProductCart> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    // Lấy số lượng từ provider để đảm bảo dữ liệu luôn cập nhật
    int currentQuantity = productProvider.getCheckoutModelList[widget.index].quantity;

    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              height: 130,
              width: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.contain,
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
                  children: <Widget>[
                    Text(widget.name),
                    const Text("Quần Áo"),
                    Text(
                      "\$ ${widget.price.toString()}",
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    widget.isCount
                        ? Container(
                            height: 30,
                            width: 100,
                            color: Colors.grey[200],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  child: const Icon(Icons.remove),
                                  onTap: () {
                                    productProvider.updateQuantity(
                                      widget.index,
                                      currentQuantity - 1,
                                    );
                                  },
                                ),
                                Text(
                                  currentQuantity.toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                                GestureDetector(
                                  child: const Icon(Icons.add),
                                  onTap: () {
                                    productProvider.updateQuantity(
                                      widget.index,
                                      currentQuantity + 1,
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        : Text(
                            "Số lượng: $currentQuantity",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}