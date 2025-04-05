import 'package:flutter/material.dart';

class Cartmodel {
  final String name;
  final String image;
  final double price;
  final int quantity;
  Cartmodel({
    required this.name,
    required this.image,
    required this.price, 
    required this.quantity
  });
}