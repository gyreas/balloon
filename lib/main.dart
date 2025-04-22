import 'package:flutter/material.dart';

void main() {
  runApp(Balloon());
}

const int minSupportedScreenWidth = 200;

class Balloon extends StatelessWidget {
  const Balloon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            var searchbarWidth = constraints.maxWidth * .8;

            if (constraints.maxWidth <= minSupportedScreenWidth) {
              return Align(child: Text("Too small"));
            }

            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchBar(
                    prompt: "Search...",
                    radius: 12,
                    width: searchbarWidth,
                  ),
                  SearchResultsList(width: searchbarWidth),
                ],
              ),
            );
          },
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
  final double width;
  const SearchResultsList({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.symmetric(horizontal: BorderSide(width: 1)),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      width: width,
      height: 500,
      child: (ListView.builder(
        itemCount: 144,
        itemBuilder:
            (context, index) => SearchResultTile(
              selected: index == 44,
              child: Text("Entry $index"),
            ),
      )),
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
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: selected ? Border.all(width: 1) : Border.all(width: 0),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        margin: const EdgeInsets.only(top: 3, bottom: 4, left: 14, right: 14),
        height: 44,
        alignment: Alignment.center,
        child: ListTile(
          title: child,
          selected: selected,
          selectedTileColor: Colors.cyan,
        ),
      ),
    );
  }
}
