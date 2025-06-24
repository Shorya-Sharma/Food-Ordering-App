import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar.dart';

abstract class SnackbarFactoryBase {
  CustomSnackbar createSnackbar(String? message);

  void showCustomSnackbar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(createSnackbar(message).getSnackbar());
  }
}
