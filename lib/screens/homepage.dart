import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_mobile/provider/category_provider.dart';
import 'package:doan_mobile/provider/product_provider.dart';
import 'package:doan_mobile/screens/detailpage.dart';
import 'package:doan_mobile/screens/listproduct.dart';
import 'package:doan_mobile/screens/login.dart';
import 'package:doan_mobile/widgets/importProduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doan_mobile/model/product.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

var featureSnapshort;
var newSnapshort;
var tshirt;
var pant;
var dress;
var shoe;
var watch;
Product? dressData;
Product? tshirtData;
Product? watchData;
Product? shoeData;
CategoryProvider? categoryProvider ;
ProductProvider? productProvider;
class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final List<String> carouselImages = [
    'images/aotetdra.jpg',
    'images/ao7dra.jpg',
    'images/ao.png',
  ];

  bool homeColor = true;

   bool gioHangColor = false;

   bool AboutColor = false;

  // widget 
  Widget _buildCategoryProduct({required String image, required int color}) {
    return CircleAvatar(
      maxRadius: 30,
      backgroundColor: Color(color),
      child: Image.asset(
        image,
        height: 30,
        color: Colors.white,
      ),
    );
  }

   Widget _buildMyDrawer(){
    return  Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/hinhuser.jpg"),
              ),
              decoration: BoxDecoration(
                color: Colors.black // mau nen
              ),
              accountName: Text(
                "Nuyễn Đức Duy", 
                style: TextStyle(color: Colors.white ),
              ), 
              accountEmail: Text("duygacon19102004@gmail.com")
            ),
            ListTile(
              selected: homeColor,
              onTap: (){
                setState(() {
                  homeColor = true;
                  gioHangColor = false;
                  AboutColor = false;
                });
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              selected: gioHangColor,
              onTap: (){
                setState(() {
                  gioHangColor =true;
                  homeColor = false;
                  AboutColor = false;
                });
              },
              leading: Icon(Icons.shopping_cart),
              title: Text("Giỏ Hàng"),
            ),
            ListTile(
              selected: AboutColor,
              onTap: (){
                setState(() {
                  AboutColor= true;
                  homeColor = false;
                  gioHangColor = false;
                });
              },
              leading: Icon(Icons.info),
              title: Text("About"),
            ),
            ListTile(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx)=>Login())
                );
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Đăng Xuất"),
            ),
          ],
        ),
      );
   }
   
  Widget _buildCategory() {
    List<Product> tshirt =categoryProvider!.getTshirtList;
    List<Product> pant =categoryProvider!.getPantList;
    List<Product> dress =categoryProvider!.getDressList;
    List<Product> shoe =categoryProvider!.getShoeList;
    List<Product> watch =categoryProvider!.getWatchList;

  return Column(
    children:<Widget> [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Danh Mục', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx)=>ListProduct(
                  name: 'Áo',
                  snapShot: tshirt,
                )),
              );
            },
            child: _buildCategoryProduct(
              image: 'images/inconAo.png', 
              color: 0xff74acf7
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx)=>ListProduct(
                  name: 'Quần',
                  snapShot: pant,
                )),
              );
            },
            child: _buildCategoryProduct(
              image: 'images/inconQuan.png', 
              color: 0xff33dcfd
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx)=>ListProduct(
                  name: 'Váy',
                  snapShot: dress,
                )),
              );
            },
            child: _buildCategoryProduct(
              image: 'images/inconDress.png', 
              color: 0xfff38cdd
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx)=>ListProduct(
                  name: 'Giày',
                  snapShot: shoe,
                )),
              );
            },
            child: _buildCategoryProduct(
              image: 'images/inconShoes.png', 
              color: 0xff4ff2af
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx)=>ListProduct(
                  name: 'Đồng Hồ',
                  snapShot: watch,
                )),
              );
            },
            child: _buildCategoryProduct(
              image: 'images/inconWatch.png', 
              color: 0xff74acf7
            ),
          ),
        ],
      ),
    ],
  );
}

  Widget _buildFeatured(){
    List<Product> featureProduct =productProvider!.getFeatureList;
     List<Product> homefeatureProduct;
     homefeatureProduct = productProvider!.getHomeFeatureList;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Nổi Bật', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx)=>ListProduct(
                    name: 'Nổi Bật',
                    snapShot: featureProduct,
                  )),
                );
              },
              child: Text('See all', 
              style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: homefeatureProduct.map((e){
            return Row(
              children:<Widget> [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:(ctx)=>Detailpage(
                          image:e.image, 
                          name: e.name, 
                          price:e.price,
                          description: "• Chất liệu: Cotton 2 chiều.\n• Regular Fit.\n• Hình in mặt trước áo áp dụng công nghệ in lụa.", 
                        ),
                      ),
                    );
                  },
                  child: Importproduct(
                    image: e.image, 
                    name:  e.name, 
                    price: e.price,)
                ),
                if (tshirtData != null)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => Detailpage(
                          image: e.image,
                          name: e.name,
                          price: e.price,
                          description: "• Chất liệu: Cotton 2 chiều.\n• Regular Fit.\n• Hình in mặt trước áo áp dụng công nghệ in lụa.",
                        ),
                      ),
                    );
                  },
                  child: Importproduct(
                    image: e.image,
                    name: e.name,
                    price: e.price,
                  ),
                )
              ],
            );
          }).toList()
        ),
      ],
    );
  }
  
  Widget _buildnew(){
    List<Product> newSnapshort =productProvider!.getNewList;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('New', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx)=>ListProduct(
                    name: 'New',
                    snapShot: newSnapshort
                  )),
                );
              },
              child: Text('See all', 
              style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: productProvider!.getHomeNewList.map((e){
            return Row(
              children:<Widget> [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:(ctx)=>Detailpage(
                          image:e.image, 
                          name: e.name, 
                          price:e.price,
                          description: "• Chất liệu: Cotton 2 chiều.\n• Regular Fit.\n• Hình in mặt trước áo áp dụng công nghệ in lụa.", 
                        ),
                      ),
                    );
                  },
                  child: Importproduct(
                    image: e.image, 
                    name:  e.name, 
                    price: e.price,)
                ),
                if (tshirtData != null)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Detailpage(
                          image: e.image,
                          name: e.name,
                          price: e.price,
                          description: "• Chất liệu: Cotton 2 chiều.\n• Regular Fit.\n• Hình in mặt trước áo áp dụng công nghệ in lụa.",
                        ),
                      ),
                    );
                  },
                  child: Importproduct(
                    image: e.image,
                    name: e.name,
                    price: e.price,
                  ),
                )
              ],
            );
          }).toList()
        ), //
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    categoryProvider =Provider.of<CategoryProvider>(context);
    categoryProvider!.getTshirtData();
    categoryProvider!.getPantData();
    categoryProvider!.getDressData();
    categoryProvider!.getShoeData();
    categoryProvider!.getWatchData();

    productProvider =Provider.of<ProductProvider>(context);
    productProvider!.getFeatureproductData();
    productProvider!.getNewproductData(); 
    productProvider!.getHomeFeatureproductData(); 
    productProvider!.getHomeNewproductData();



    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => _key.currentState!.openDrawer(),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_none, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children:<Widget> [
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
              items: carouselImages.map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                );
              }).toList(),
            ),
            _buildCategory(),
            SizedBox(height: 20),
            _buildFeatured(),
             SizedBox(height: 20),
             _buildnew(),
          ],
        ),
      ),
    );
  }
}