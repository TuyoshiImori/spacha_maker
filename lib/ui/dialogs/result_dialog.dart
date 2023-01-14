import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spacha_maker/themes/app_colors.dart';

void resultDialog({
  required BuildContext context,
  required String message,
  int backCount = 1,
  int closeTime = 1,
  Object? value,
}) {
  Timer? timer;
  showDialog(
    builder: (context) {
      timer = Timer(Duration(seconds: closeTime), () {
        Navigator.pop(context);
      });
      return AlertDialog(
        content: SizedBox(
          height: 50,
          width: 280,
          child: Center(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                color: black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: white,
      );
    },
    context: context,
  ).then((value) {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
  }).then((_) {
    if (backCount > 1) {
      for (var i = 0; i < backCount - 1; i++) {
        Navigator.pop(context);
      }
    }
  });
}
