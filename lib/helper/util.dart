import 'package:flutter/material.dart';
import 'package:get/get.dart';

showProgressBar() {
  Get.dialog(
      const Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      )),
      barrierDismissible: false);
}

showSnackBarTwo(String title, String message, Color backgroundColor) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white);
}

showSnackBar(String title, String message, Color backgroundColor,
    bool iconIsVisible, String iconType) {
  Get.snackbar(title, message,
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      titleText: const Text(
        "",
        style: TextStyle(fontSize: 0),
      ),
      icon: Padding(
        padding: const EdgeInsets.all(0.0),
        child: CircleAvatar(
          backgroundColor: iconType == "error"
              ? Colors.red
              : iconType == "warning"
                  ? Colors.red
                  : Colors.green,
          radius: 20,
          child: Icon(
            iconType == "error"
                ? Icons.close
                : iconType == "warning"
                    ? Icons.info_outline
                    : Icons.done,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 350),
      padding: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      boxShadows: [
        BoxShadow(
          color: Colors.transparent.withOpacity(0.4),
          spreadRadius: 0,
          blurRadius: 5,
          offset: const Offset(1, 1), // changes position of shadow
        ),
      ],
      colorText: iconType == "warning" ? Colors.white : Colors.white);
}
