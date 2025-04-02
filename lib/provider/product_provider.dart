import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_mobile/model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{
  

//feature product
  List<Product> featureproduct= [];
  Product? featureproductData;
  Future<void> getFeatureproductData() async {
    List<Product> newlist = [];
    QuerySnapshot featureSnapshot = await FirebaseFirestore.instance
    .collection("product")
    .doc("1HgSL0xNRTgFI2sM7Dtb")
    .collection("featureproduct")
    .get();
    featureSnapshot.docs.forEach((element) {
      featureproductData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(featureproductData!);
    },);
    featureproduct = newlist;  
    notifyListeners();  
  }
  List<Product> get getFeatureList {
    return featureproduct;
    
  }


//new product
   List<Product> newproduct= [];
  Product? newproductData;
  Future<void> getNewproductData() async {
    List<Product> newlist = [];
    QuerySnapshot newSnapshot = await FirebaseFirestore.instance
    .collection("product")
    .doc("1HgSL0xNRTgFI2sM7Dtb")
    .collection("featureproduct")
    .get();
    newSnapshot.docs.forEach((element) {
      newproductData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(newproductData!);
    },);
    newproduct = newlist;   
    notifyListeners(); 
  }
  List<Product> get getNewList {
    return newproduct;
  }

//homefeature Product
 List<Product> homefeatureproduct= [];
  Product? homefeatureproductData;
  Future<void> getHomeFeatureproductData() async {
    List<Product> newlist = [];
    QuerySnapshot homenewSnapshot = await FirebaseFirestore.instance
    .collection("homefeature")
    .get();
    homenewSnapshot.docs.forEach((element) {
      homefeatureproductData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(homefeatureproductData!);
    },);
    homefeatureproduct = newlist;
    notifyListeners();    
  }
  List<Product> get getHomeFeatureList {
    return homefeatureproduct;
  }

//homnew product
 List<Product> homenewproduct= [];
  Product? homenewproductData;
  Future<void> getHomeNewproductData() async {
    List<Product> newlist = [];
    QuerySnapshot newSnapshot = await FirebaseFirestore.instance
    .collection("homenew")
    .get();
    newSnapshot.docs.forEach((element) {
      homenewproductData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(homenewproductData!);
    },);
    homenewproduct = newlist;  
    notifyListeners();  
  }
  List<Product> get getHomeNewList {
    return homenewproduct;
  }

}