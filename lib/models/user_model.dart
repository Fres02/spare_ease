import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String userId,
      username,
      password,
      firstName,
      lastName,
      address,
      contactNumber,
      email;
  final Timestamp createdAt;
  final List userCart, userWish;
  UserModel({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.password,
    required this.lastName,
    required this.address,
    required this.contactNumber,
    required this.email,
    required this.userCart,
    required this.userWish,
    required this.createdAt,
  });
}
