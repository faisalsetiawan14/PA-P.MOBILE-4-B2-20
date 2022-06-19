import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> CustomAlert(BuildContext context, String alert) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 104, 109, 104),
        title: const Text(
          "Thank you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Column(children: [
            Text(
              alert,
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/1.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Oke"),
            ),
          ]),
        ],
      );
    },
  );
}
