import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar.dart';

class SuccessSnackbar implements CustomSnackbar {
  SuccessSnackbar(String message) : message = message;

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
  IconData getIcon() => Icons.check_circle_outline;

  @override
  Color getColor() {
    return Colors.green;
  }

  @override
  final String message;

  String get title => "Success";

  @override
  set title(String _title) {
    title = _title;
  }
}
