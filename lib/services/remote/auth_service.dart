import 'package:evira/model/auth_model.dart';
import 'package:evira/styles/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static AuthService? _authService;

  AuthService._internal(){
    _authService = this;
  }

  factory AuthService() => _authService ?? AuthService._internal();

  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future login(String email, String password) async{
    var auth= Auth(name: "", email: email, password: password);

    return await http.post(
      Uri.parse(AppProperties.signInUrl),
      headers: headers,
      body: json.encode(auth.toJson()),
    );
  }

  Future register(String name, String email, String password) async{
    var auth= Auth(name: name, email: email, password: password);

    return await http.post(
      Uri.parse(AppProperties.signUpUrl),
      headers: headers,
      body: json.encode(auth.toJson()),
    );
  }

  Future checkTokenExpiry(String token) async {
    var tokenObject = <String, String>{};
    tokenObject.putIfAbsent('token', () => token);

    return await http.post(
      Uri.parse(AppProperties.checkTokenExpiryUrl),
      body: json.encode(tokenObject),
      headers: headers,
    );
  }

  Future changeName(String name, String userId, String jwtToken) async {
    headers.putIfAbsent('Authorization', () => 'Bearer $jwtToken');
    var bodyObject = <String, String>{};
    bodyObject.putIfAbsent('name', () => name);

    return await http.patch(
      Uri.parse("${AppProperties.changeNameUrl}$userId"),
      headers: headers,
      body: json.encode(bodyObject),
    );
  }

  Future forgotPassword(String email) async {
    var bodyObject = <String, String>{};
    bodyObject.putIfAbsent('email', () => email);
    return await http.post(
      Uri.parse(AppProperties.forgotPasswordUrl),
      headers: headers,
      body: json.encode(bodyObject),
    );
  }

}