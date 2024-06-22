import 'package:flutter/material.dart';

class WebtoonsCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;

  const WebtoonsCard({
    super.key,
    required this.title,
    required this.thumbnailUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          height: 500,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: const Offset(
                  0.0,
                  10.0,
                ),
                blurRadius: 10.0,
                spreadRadius: -6.0,
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(thumbnailUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Thai",
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
