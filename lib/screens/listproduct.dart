import 'package:do_an_mobile/model/product.dart';
import 'package:do_an_mobile/screens/detailpage.dart';
import 'package:do_an_mobile/screens/homepage.dart';
import 'package:do_an_mobile/widgets/importProduct.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String name;
  final List<Product> snapShot;
  const ListProduct({super.key,required this.name,required this.snapShot});
  // Widget _buildCategory({required String image,required int color}) {
  //   return CircleAvatar(
  //     maxRadius: 38,
  //     backgroundColor: Color(color),
  //     child: Container(
  //       height: 40,
  //       child: Image(
  //         color: Colors.white,
  //         image:AssetImage('images/$image' ),
  //         fit: BoxFit.contain,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, // Màu sắc của icon
        ),
        
      actions: <Widget>[
        IconButton(
          onPressed:(){}, 
          icon: Icon(Icons.search)
        ),
        IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.notifications_none))
      ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Column(
              children:<Widget> [
                Container(
                  height: 700,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    scrollDirection: Axis.vertical,
                    children: snapShot.map((e) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Detailpage(
                              image: e.image,
                              name: e.name,
                              price: e.price,
                              description: e.description ?? "No description available", // Added description parameter
                              
                            ),
                          ),
                        );
                      },
                      child: Importproduct(
                        price: e.price,
                        image: e.image,
                        name: e.name,
                      ),
                    )).toList(),
                  ),
                ),
                
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 700,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    scrollDirection: Axis.vertical,
                    children: snapShot.map((e)=>Importproduct(
                      price: e.price,
                      image: e.image,
                      name: e.name,
                    ),).toList(),
                  ),
                )
              ],
            ),
          ],
        ),
      ), 
    );
  }
}