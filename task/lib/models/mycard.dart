import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard(
      {super.key,
      required this.id,
      required this.title,
      required this.body,
      required this.clr});
  int id;
  String title = '';
  Color clr;
  String body = '';
  @override
  Widget build(BuildContext context) {
    return Card(
        color: clr,
        child: Column(
          children: [
            Text(id.toString()),
            Text(" Title: $title"),
            const SizedBox(
              height: 10,
            ),
            Text('Body : $body'),
          ],
        ));
  }
}
