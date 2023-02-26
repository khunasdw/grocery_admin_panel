import 'package:flutter/material.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }
  static Future<void> warningDialog(
      {
        required String title, required String subtitle, required VoidCallback myFunction,
        required BuildContext context,
      }
      ) async => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.logout),
          const SizedBox(
            width: 5,
          ),
          Text(title)
        ],
      ),
      content: Text(subtitle),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.lightBlue),
          ),
        ),
        TextButton(
          onPressed: () {
            myFunction;
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    ),
  );
  static Future<void> errorDialog(
      {required String subtitle,
        required BuildContext context,
      }
      ) async => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: const [
          Icon(Icons.logout),
          Text('An Error occurred'),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      content: Text(subtitle),
      actions: [
        TextButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.lightBlue),
          ),
        ),
        TextButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    ),
  );
}
