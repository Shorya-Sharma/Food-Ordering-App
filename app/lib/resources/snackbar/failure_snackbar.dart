import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar.dart';

class FailureSnackbar implements CustomSnackbar {
  FailureSnackbar(String message) : message = message;

  @override
  Color getColor() {
    return Colors.red;
  }

  @override
  SnackBar getSnackbar() {
    return SnackBar(
      backgroundColor: getColor(),
      duration: Duration(seconds: 1),
      content: Row(
        children: [
          Icon(
            getIcon(),
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(message),
            ],
          ),
        ],
      ),
    );
  }

  @override
  IconData getIcon() => Icons.error_outline;

  @override
  final String message;

  @override
  String get title => "Failure";

  @override
  set title(String _title) {
    title = _title;
  }
}
