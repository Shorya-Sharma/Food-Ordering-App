import 'package:food_delivery_app/resources/snackbar/snackbar.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar_factory_base.dart';
import 'package:food_delivery_app/resources/snackbar/success_snackbar.dart';

import 'failure_snackbar.dart';
import 'information_snackbar.dart';

class SuccessSnackbarFactory extends SnackbarFactoryBase {
  @override
  CustomSnackbar createSnackbar(String? message) {
    return SuccessSnackbar(message ?? 'Operation completed successfully');
  }
}

class FailureSnackbarFactory extends SnackbarFactoryBase {
  @override
  CustomSnackbar createSnackbar(String? message) {
    return FailureSnackbar(message ?? 'An error occurred');
  }
}

class InformationSnackbarFactory extends SnackbarFactoryBase {
  @override
  CustomSnackbar createSnackbar(String? message) {
    return InformationSnackbar(message ?? 'Information');
  }
}
