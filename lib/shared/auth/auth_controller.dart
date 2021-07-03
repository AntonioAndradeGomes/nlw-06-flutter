import 'package:flutter/material.dart';
import 'package:payflow/shared/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  //var _isAuthenticated = false;
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      //_isAuthenticated = true;
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      //_isAuthenticated = false;
      //_user = null;
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  void saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    if (instance.containsKey('user')) {
      final user = instance.get('user') as String;
      setUser(context, UserModel.fromJson(user));
      return;
    } else {
      setUser(context, null);
    }
  }
}
