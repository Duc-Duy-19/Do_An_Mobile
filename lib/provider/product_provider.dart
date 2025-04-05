import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_mobile/model/cartmodel.dart';
import 'package:do_an_mobile/model/product.dart';
import 'package:do_an_mobile/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  
  List<UserModel> UsermodeList = [];
  UserModel? userModel;
  Future<void> getUserData() async {
    List<UserModel> newList = [];
    User currenUser = FirebaseAuth.instance.currentUser!;
    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .get();
    userSnapshot.docs.forEach((element) {
      if(currenUser.uid == element['usererId']){
        userModel = UserModel(
          username: element['username'],
          email: element['email'],
          phone: element['phone'],
          gioitinh: element['gioitinh'],
        );
        newList.add(userModel!);
      }
      UsermodeList = newList;
      
    });
    notifyListeners();
  }
  List<UserModel> get getUserModel {
    return UsermodeList;
  }
  


  List<Cartmodel> cartModelList = [];
  late Cartmodel cartModel;

  List<Cartmodel> checkOutModelList = [];
  late Cartmodel checkOutModel;

  void getCheckOutCartData({
    required String name,
    required String image,
    required int quantity, // Sửa quentity thành quantity
    required double price,
  }) {
    checkOutModel = Cartmodel(
      name: name,
      image: image,
      price: price,
      quantity: quantity,
    );
    checkOutModelList.add(checkOutModel);
    notifyListeners();
  }

  List<Cartmodel> get getCheckoutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }

  void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < checkOutModelList.length && newQuantity >= 1) {
      checkOutModelList[index] = Cartmodel(
        name: checkOutModelList[index].name,
        image: checkOutModelList[index].image,
        price: checkOutModelList[index].price,
        quantity: newQuantity, // Sửa quentity thành quantity
      );
      notifyListeners();
    }
  }



  // Các phương thức còn lại của ProductProvider
  List<Product> featureproduct = [];
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
        description: element['description'],
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(featureproductData!);
    });
    featureproduct = newlist;
    notifyListeners();
  }

  List<Product> get getFeatureList {
    return featureproduct;
  }

  List<Product> newproduct = [];
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
    });
    newproduct = newlist;
    notifyListeners();
  }

  List<Product> get getNewList {
    return newproduct;
  }

  List<Product> homefeatureproduct = [];
  Product? homefeatureproductData;
  Future<void> getHomeFeatureproductData() async {
    List<Product> newlist = [];
    QuerySnapshot homenewSnapshot =
        await FirebaseFirestore.instance.collection("homefeature").get();
    homenewSnapshot.docs.forEach((element) {
      homefeatureproductData = Product(
        description: element['description'],
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(homefeatureproductData!);
    });
    homefeatureproduct = newlist;
    notifyListeners();
  }

  List<Product> get getHomeFeatureList {
    return homefeatureproduct;
  }

  List<Product> homenewproduct = [];
  Product? homenewproductData;
  Future<void> getHomeNewproductData() async {
    List<Product> newlist = [];
    QuerySnapshot newSnapshot =
        await FirebaseFirestore.instance.collection("homenew").get();
    newSnapshot.docs.forEach((element) {
      homenewproductData = Product(
        image: element['image'],
        name: element['name'],
        price: element['price'].toDouble(),
      );
      newlist.add(homenewproductData!);
    });
    homenewproduct = newlist;
    notifyListeners();
  }

  List<Product> get getHomeNewList {
    return homenewproduct;
  }

  List<String> NotificationShoppingCartList = [];
  void addNotificationShoppingCart(String NoficationShoppingCart) {
    NotificationShoppingCartList.add(NoficationShoppingCart);
    notifyListeners();
  }

  int get getNotificationShoppingCartListLenght {
    return NotificationShoppingCartList.length;
  }
}