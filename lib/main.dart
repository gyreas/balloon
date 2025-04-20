import 'package:flutter/material.dart';

void main() {
  runApp(Balloon());
}

class Balloon extends StatelessWidget {
  const Balloon({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SearchBar(prompt: "Search", radius: 12, width: 444),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final String prompt;
  final String? fieldLabel;
  final double width;
  final double radius;

  const SearchBar({
    super.key,
    this.prompt = "Search",
    this.fieldLabel,
    this.radius = 4,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          labelText: fieldLabel,
          hintText: prompt,
          fillColor: Colors.amber,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
      ),
    );
  }
}
