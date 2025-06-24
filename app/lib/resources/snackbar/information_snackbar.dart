import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar.dart';

class InformationSnackbar implements CustomSnackbar {
  InformationSnackbar(String message) : message = message;

  Color getColor() {
    return Colors.blue;
  }

  @override
  SnackBar getSnackbar() {
    return SnackBar(
      backgroundColor: getColor(),
      duration: Duration(seconds: 1),
      content: Row(
        children: [
          Icon(getIcon()),
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
  IconData getIcon() => Icons.info_outline;
  @override
  @override
  final String message;

  @override
  String get title => "Information";

  @override
  set title(String _title) {
    title = _title;
  }
}
