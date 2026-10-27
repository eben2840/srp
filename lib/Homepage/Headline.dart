import 'package:flutter/material.dart';


class Headline extends StatelessWidget {
  const Headline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0, right: 8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Shortcut",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Categories",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Text(
            "View More",
            style: TextStyle(
                color: Color.fromARGB(255, 131, 20, 20), fontWeight: FontWeight.normal, fontSize: 12),
          ),
        ],
      ),
    );
  }
}