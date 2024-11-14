import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackMassage(bool isError, String message) {
  Get.snackbar(
    isError == true ? 'error' : 'success',
    message,
    colorText: isError == true ? Colors.red : Colors.green,
    borderColor: isError == true ? Colors.red : Colors.green,
  );
}
