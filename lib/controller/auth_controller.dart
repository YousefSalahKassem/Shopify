import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../components/snak_bar.dart';
import '../services/remote/auth_service.dart';
import 'error_controller.dart';

class AuthController with ChangeNotifier {
  final _authService = AuthService();
  final _storage = const FlutterSecureStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();

  bool _loading = false;

  bool get loading => _loading;

  AuthController() {
    getUserName();
    getUserEmail();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }


  saveUserDataAndLoginStatus(String userId, String isLoggedFlag, String jwt, String email, String name) async {
    await _storage.write(key: 'UserId', value: userId);
    await _storage.write(key: 'IsLoggedFlag', value: isLoggedFlag);
    await _storage.write(key: 'jwt', value: jwt);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'name', value: name);
  }

  getUserDataAndLoginStatus() async {
    String? userId = await _storage.read(key: 'UserId');
    String? isLoggedFlag = await _storage.read(key: 'IsLoggedFlag');
    String? token = await _storage.read(key: 'jwt');
    String? email = await _storage.read(key: 'email');
    String? name = await _storage.read(key: 'name');
    return [userId, isLoggedFlag, token, email, name];
  }

  Future<String> getUserName() async {
    String? name = await _storage.read(key: 'name');
    return Future.value(name);
  }

  Future<String> getUserEmail() async {
    String? email = await _storage.read(key: 'email');
    return Future.value(email);
  }

  Future<bool> getUserToken() async {
    String? token = await _storage.read(key: 'jwt');
    if (token == null) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  deleteUserDataAndLoginStatus() async {
    await _storage.deleteAll();
  }

  Future<bool> isRegistered(BuildContext context) async {
    try {
      var response = await _authService.register(userNameController.text,
          emailController.text, passwordController.text);

      if (response.statusCode == 201) {
        var jsonResponse = json.decode(response.body);
        var token = jsonResponse['data']['token'];
        var userId = jsonResponse['data']['user']['id'];
        var email = jsonResponse['data']['user']['email'];
        var name = jsonResponse['data']['user']['name'];
        await saveUserDataAndLoginStatus(userId, '1', token, email, name);
        return true;
      } else {
        ErrorController.showErrorFromApi(context, response);
        return false;
      }
    } on SocketException catch (_) {
      ErrorController.showNoInternetError(context);
      return false;
    } on HttpException catch (_) {
      ErrorController.showNoServerError(context);
      return false;
    } on FormatException catch (_) {
      ErrorController.showFormatExceptionError(context);
      return false;
    } catch (e) {
      ErrorController.showUnKownError(context);
      return false;
    }
  }


  Future<bool> isLoggedIn(BuildContext context) async {
    try {
      var response = await _authService.login(emailController.text,
          passwordController.text);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var token = jsonResponse['data']['token'];
        var userId = jsonResponse['data']['user']['id'];
        var email = jsonResponse['data']['user']['email'];
        var name = jsonResponse['data']['user']['name'];
        await saveUserDataAndLoginStatus(userId, '1', token, email, name);
        return true;
      } else {
        ErrorController.showErrorFromApi(context, response);
        return false;
      }
    } on SocketException catch (_) {
      ErrorController.showNoInternetError(context);
      return false;
    } on HttpException catch (_) {
      ErrorController.showNoServerError(context);
      return false;
    } on FormatException catch (_) {
      ErrorController.showFormatExceptionError(context);
      return false;
    } catch (e) {
      ErrorController.showUnKownError(context);
      return false;
    }
  }

  Future<bool> isTokenValid() async {
    String? token = await _storage.read(key: 'jwt');

    if (token == null || token.isEmpty) {
      return false;
    }
    var response = await _authService.checkTokenExpiry(token);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changeName(BuildContext context) async {
    try {
      var data = await getUserDataAndLoginStatus();

      var response = await _authService.changeName(
          userNameController.text, data[0], data[2]);

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        await _storage.write(key: 'name', value: responseBody['data']['name']);

        return true;
      } else {
        ErrorController.showErrorFromApi(context, response);
        return false;
      }
    } on SocketException catch (_) {
      ErrorController.showNoInternetError(context);
      return false;
    } on HttpException catch (_) {
      ErrorController.showNoServerError(context);
      return false;
    } on FormatException catch (_) {
      ErrorController.showFormatExceptionError(context);
      return false;
    } catch (e) {
      ErrorController.showUnKownError(context);
      return false;
    }
  }

  Future<bool> forgotPassword(BuildContext context) async {
    try {
      _loading = true;
      var response = await _authService.forgotPassword(emailController.text);

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);

        GlobalSnackBar.showSnackbar(
          context,
          responseBody['message'],
          SnackBarType.Success,
        );
        _loading = false;
        return true;
      } else {
        ErrorController.showErrorFromApi(context, response);
        _loading = false;
        return false;
      }
    } on SocketException catch (_) {
      ErrorController.showNoInternetError(context);
      return false;
    } on HttpException catch (_) {
      ErrorController.showNoServerError(context);
      return false;
    } on FormatException catch (_) {
      ErrorController.showFormatExceptionError(context);
      return false;
    } catch (e) {
      ErrorController.showUnKownError(context);
      return false;
    }
  }
}
