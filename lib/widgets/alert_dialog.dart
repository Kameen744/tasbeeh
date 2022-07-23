import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

showAlertDialog({
  required BuildContext context,
  required String msg,
  required model,
  yes,
  no,
}) {
  Widget cancelButton = TextButton(
    child: Text("Yes"),
    onPressed: yes,
    style: getButtonStyle(model),
  );

  Widget continueButton = TextButton(
    child: Text("No"),
    onPressed: no,
    style: getButtonStyle(model),
  );

  AlertDialog alert = AlertDialog(
    title: Center(
      child: Text(
        "Tasbeeh Alert!",
        style: TextStyle(
          color: model.themeDark ? grey : black,
        ),
      ),
    ),
    content: Text(
      msg,
      style: TextStyle(
        color: model.themeDark ? grey : black,
      ),
    ),
    actions: [
      continueButton,
      cancelButton,
    ],
    backgroundColor: model.themeDark ? darkGrey : primary,
    actionsPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    titlePadding: EdgeInsets.all(10),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

getButtonStyle(model) {
  return ButtonStyle(
    shadowColor: model.themeDark ? getColor(grey) : getColor(darkGrey),
    backgroundColor: model.themeDark ? getColor(black) : getColor(lightGreen),
    foregroundColor: model.themeDark ? getColor(grey) : getColor(primary),
  );
}

getColor(Color color) {
  return MaterialStateProperty.resolveWith((states) => color);
}

showSnackBar({
  required BuildContext context,
  required String message,
  required model,
}) {
  double space = model.hPercent(context, 90);
  final snackBar = SnackBar(
    duration: Duration(seconds: 1),
    margin: EdgeInsets.only(top: space),
    behavior: SnackBarBehavior.floating,
    backgroundColor: model.themeDark ? darkGrey : primary,
    content: Center(
      child: Text(
        message,
        style: TextStyle(
          color: model.themeDark ? grey : black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
