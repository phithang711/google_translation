import 'package:flutter/material.dart';

class UtilDialog {
  static Future<void> showAlertNoApiKeyDialog({
    required BuildContext context,
    required String dialogTitle,
    String dialogMessage = "",
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content:
              (dialogMessage != "") ? Text(dialogMessage) : const SizedBox(),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
