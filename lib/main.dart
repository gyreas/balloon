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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchBar(prompt: "Search...", radius: 12, width: searchbarWidth),
            SearchResultsList(),
          ],
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
    return Container(
      margin: const EdgeInsets.only(top: 0),
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

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional(0, 0),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      width: 300,
      height: 500,
      child: ListView.builder(
        itemCount: 144,
        itemBuilder:
            (context, index) => SearchResultTile(
              selected: index == 44,
              child: Text("Entry $index"),
            ),
      ),
    );
  }
}

class SearchResultTile extends StatelessWidget {
  final Widget child;
  final bool selected;

  const SearchResultTile({
    super.key,
    this.selected = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: ListTile paints the Tiles that are marked as selected even when they're
    // not within the ListView viewport, what's going on here?
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(0),
      color: selected ? Colors.cyan : null,
      child: SearchResultItem(child: child),
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final Widget child;
  const SearchResultItem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: Colors.greenAccent,
      ),
      margin: const EdgeInsets.only(left: 4, right: 4),
      height: 64,
      child: child,
    );
  }
}
