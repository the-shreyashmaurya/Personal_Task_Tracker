// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String userId = "";
  String name = "";
  String email = "";

  void updateUserData({
    required String userId,
    required String name,
    required String email,
  }) {
    this.userId = userId;
    this.name = name;
    this.email = this.email;
    notifyListeners();
  }
}
