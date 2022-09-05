import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  String id;
  String prenom;
  String nom;
  String email;

  UserModel({
    required this.id,
    required this.prenom,
    required this.nom,
    required this.email,
  });

  static UserModel sessionUser =
      UserModel(id: '', prenom: '', nom: '', email: '');

  factory UserModel.fromJson(Map<String, dynamic> user) => UserModel(
        id: user['id'],
        prenom: user['prenom'],
        nom: user['nom'],
        email: user['email'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "prenom": prenom,
        "nom": nom,
        "email": email,
      };

  static void saveUser(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final data = json.encode(user.toMap());
    pref.setString("user", data);
    pref.commit();
  }

  static void getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final data = pref.getString("user");
    if (data != null) {
      final decode = json.decode(data);
      final user = await UserModel.fromJson(decode);
      sessionUser = user;
    } else {
      sessionUser = UserModel(id: '', prenom: '', nom: '', email: '');
    }

    print(sessionUser.id);
  }

  static void logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("user", '');
    sessionUser = UserModel(id: '', prenom: '', nom: '', email: '');
    pref.clear();
  }
}
