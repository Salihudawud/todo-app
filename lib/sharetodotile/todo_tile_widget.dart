import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils.dart';

class todotilewidget extends StatefulWidget {
  todotilewidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.status})
      : super(key: key);
  final String title;
  final String description;
  final String dateTime;
  final bool status;

  @override
  State<todotilewidget> createState() => _todotilewidgetState();
}

class _todotilewidgetState extends State<todotilewidget> {
  bool ischeck = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (ischeck == true) {
                  ischeck = false;
                } else {
                  ischeck = false;
                }
              });
            },
            child: const Icon(
              Icons.check_circle_outline,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Trip to maldives,I decided to go for a walk '),
                Text(" certain goods at very low cost.sorry bye bye"),
              ],
            ),
          ),
          const Text(
            'yesterday',
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}

class sizeBox extends StatelessWidget {
  const sizeBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: customColor(date: 'appbarColor'),
      size: 50.0,
    );
  }
}
