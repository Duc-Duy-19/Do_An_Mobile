import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_mobile/model/product.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier{

  
  List<Product> tshirt = [];
  Product? tshirtData;

   List<Product> pant = [];
  Product? pantData;

  List<Product> dress = [];
  Product? dressData;

  List<Product> shoe = [];
  Product? shoeData;

  List<Product> watch = [];
  Product? watchData;
  
  Future<void> getTshirtData() async {
    List<Product> newlist = [];
    QuerySnapshot tshirtSnapshot = await FirebaseFirestore.instance
    .collection("category")
    .doc("M0dAa8OfSOqUfNBQE3oI")
    .collection("tshirt")
    .get();
    tshirtSnapshot.docs.forEach((element) {
      tshirtData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(tshirtData!);
    },);
    tshirt = newlist;
    notifyListeners(); // Notify listeners after data is fetched   
  }
  List<Product> get getTshirtList {
    return tshirt;
  }

  Future<void> getPantData() async {
    List<Product> newlist = [];
    QuerySnapshot pantSnapshot = await FirebaseFirestore.instance
    .collection("category")
    .doc("M0dAa8OfSOqUfNBQE3oI")
    .collection("pant")
    .get();
    pantSnapshot.docs.forEach((element) {
      pantData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(pantData!);
    },);
    pant = newlist;   
    notifyListeners();
  }
  List<Product> get getPantList {
    return pant;
  }

  Future<void> getDressData() async {
    List<Product> newlist = [];
    QuerySnapshot dressSnapshot = await FirebaseFirestore.instance
    .collection("category")
    .doc("M0dAa8OfSOqUfNBQE3oI")
    .collection("dress")
    .get();
    dressSnapshot.docs.forEach((element) {
      dressData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(dressData!);
    },);
    dress = newlist; 
    notifyListeners();  
  }
  List<Product> get getDressList {
    return dress;
  }

  Future<void> getShoeData() async {
    List<Product> newlist = [];
    QuerySnapshot shoeSnapshot = await FirebaseFirestore.instance
    .collection("category")
    .doc("M0dAa8OfSOqUfNBQE3oI")
    .collection("shoe")
    .get();
    shoeSnapshot.docs.forEach((element) {
      shoeData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(shoeData!);
    },);
    shoe = newlist;  
    notifyListeners(); 
  }
  List<Product> get getShoeList {
    return shoe;
  }

  Future<void> getWatchData() async {
    List<Product> newlist = [];
    QuerySnapshot watchSnapshot = await FirebaseFirestore.instance
    .collection("category")
    .doc("M0dAa8OfSOqUfNBQE3oI")
    .collection("watch")
    .get();
    watchSnapshot.docs.forEach((element) {
      watchData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(watchData!);
    },);
    watch = newlist; 
    notifyListeners();  
  }
  List<Product> get getWatchList {
    return watch;
  }

}