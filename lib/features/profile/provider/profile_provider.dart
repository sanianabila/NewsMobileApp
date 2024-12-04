import 'dart:io';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  String _name = 'Sania Nabila';
  String _email = 'sania.nese@gmail.com';
  File? _profileImage;

  String get name => _name;
  String get email => _email;
  File? get profileImage => _profileImage;

  void updateProfile(String newName, String newEmail, File? newProfileImage) {
    _name = newName;
    _email = newEmail;
    _profileImage = newProfileImage;
    notifyListeners();
  }
}
