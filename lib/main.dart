import 'package:flutter/material.dart';

void main() {
  runApp(Balloon());
}

const int minSupportedScreenWidth = 200;

class Balloon extends StatelessWidget {
  const Balloon({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var screenWidth = constraints.maxWidth;
        return (screenWidth >= minSupportedScreenWidth)
            ? _build(screenWidth * .7)
            : MaterialApp(
              home: Scaffold(body: Align(child: Text("Too small"))),
            );
      },
    );
  }

  Widget _build(double searchbarWidth) => MaterialApp(
    home: Scaffold(
      body: Align(
        child: SearchBar(
          prompt: "Search...",
          radius: 12,
          width: searchbarWidth,
        ),
      ),
    ),
  );
}

class SearchBar extends StatelessWidget {
  final String prompt;
  final String? fieldLabel;
  final double width;
  final double radius;

  const SearchBar({
    super.key,
    this.prompt = "Search...",
    this.fieldLabel = "Search",
    this.radius = 4,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        cursorColor: Colors.black,
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
