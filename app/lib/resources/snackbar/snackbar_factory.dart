import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/constants/snackbar_type.dart';
import 'package:food_delivery_app/resources/snackbar/failure_snackbar.dart';
import 'package:food_delivery_app/resources/snackbar/information_snackbar.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar.dart';
import 'package:food_delivery_app/resources/snackbar/success_snackbar.dart';

class SnackbarFactory {
  static SnackbarFactory _snackbarFactory = SnackbarFactory._();

  SnackbarFactory._();
  static SnackbarFactory get instance => _snackbarFactory;
  CustomSnackbar createSnackbar(SnackBarType snackBarType, String? message) {
    switch (snackBarType) {
      case SnackBarType.success:
        return SuccessSnackbar(message ?? 'Operation completed successfully');
      case SnackBarType.error:
        return FailureSnackbar(message ?? 'An error occurred');
      case SnackBarType.info:
        return InformationSnackbar(message ?? 'Information');
      default:
        return InformationSnackbar(message ?? 'Information');
    }
  }

  void showCustomSnackbar(BuildContext context, SnackBarType snackbarType, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
        createSnackbar(snackbarType, message ).getSnackbar()
    );
  }
}
