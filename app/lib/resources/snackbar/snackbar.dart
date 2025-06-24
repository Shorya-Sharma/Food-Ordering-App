import 'package:flutter/material.dart';

abstract class CustomSnackbar {
  CustomSnackbar({required this.message});
  final String message;
  String title = "Snackbar";
  SnackBar getSnackbar() => SnackBar(content: Text("Default Snackbar"));
  IconData getIcon() => Icons.disabled_by_default;
  Color getColor() => Colors.black ;
}
