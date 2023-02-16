import 'package:flutter/material.dart';

class ReuseableColumn extends StatelessWidget {
  const ReuseableColumn(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.subtitle});

  final String imgUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image(
            height: 50,
            width: 50,
            image: NetworkImage(
              imgUrl,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
