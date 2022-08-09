import 'dart:convert';
import 'package:flutter/material.dart';

import '../components/snak_bar.dart';

class ErrorController {
  static showErrorFromApi(BuildContext context, var response) {
    var resBody = json.decode(response.body);
    String message = ErrorController()._formatErrorFromApi(resBody['message']);
    ErrorController()._showErrorSnackBar(context, message);
  }

  static showNoInternetError(BuildContext context) {
    ErrorController()._showErrorSnackBar(context, 'No internet connection');
  }

  static showNoServerError(BuildContext context) {
    ErrorController()._showErrorSnackBar(context, 'Failed to reach server');
  }

  static showFormatExceptionError(
      BuildContext context,
      ) {
    ErrorController()._showErrorSnackBar(context, 'Bad format error');
  }

  static showUnKownError(BuildContext context) {
    ErrorController()._showErrorSnackBar(context, 'Unknown error');
  }

  static showCustomError(BuildContext context, String message) {
    ErrorController()._showErrorSnackBar(context, message);
  }

  _showErrorSnackBar(BuildContext context, String message) {
    GlobalSnackBar.showSnackbar(context, message, SnackBarType.Error);
  }

  _formatErrorFromApi(String message) {
    switch (message) {
      case 'Jwt token is invalid':
        return message = 'Authentication failed';
      default:
        return message;
    }
  }
}