/*
MIT License Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished
to do so, subject to the following conditions:

The above copyright notice and this permission notice (including the next
paragraph) shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import 'package:balloon/search_list.dart' show loadN;
import 'package:flutter/material.dart';

void main() {
  runApp(Balloon());
}

const int minSupportedScreenWidth = 200;

class Balloon extends StatefulWidget {
  const Balloon({super.key});

  @override
  State<StatefulWidget> createState() => _BalloonState();
}

class _BalloonState extends State<Balloon> {
  ResultListNotifier listNotifier = ResultListNotifier();

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
                    onChanged: (resultList) {
                      print("Main::onChanged");
                      listNotifier.resultList = resultList;
                      listNotifier.notify();
                    },
                  ),
                  ListenableBuilder(
                    listenable: listNotifier,
                    builder:
                        (context, child) => SearchResultsList(
                          width: searchbarWidth,
                          // TODO: inefficient
                          index: listNotifier.index,
                          list: listNotifier.resultList,
                        ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ResultListNotifier extends ChangeNotifier {
  int index = 0;
  List<String> resultList = [];

  void notify() {
    notifyListeners();
  }
}

List<String> strings = loadN(444);

class SearchBar extends StatelessWidget {
  final String prompt;
  final String? fieldLabel;
  final double width;
  final double radius;
  final ValueChanged<List<String>> onChanged;

  const SearchBar({
    super.key,
    this.prompt = "Search...",
    this.fieldLabel = "Search",
    this.radius = 4,
    required this.width,
    required this.onChanged,
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
        onChanged: (finalQuery) {
          // TODO: perform the search here
          onChanged(_search(finalQuery, strings));
        },
      ),
    );
  }

  // TODO: do this async
  List<String> _search(String query, List<String> source) {
    if (query.isEmpty) {
      return [];
    }

    var resultList = <String>[];
    for (var s in strings) {
      if (s.contains(query)) {
        resultList.add(s);
      }
    }
    return resultList;
  }
}

class NullWidget extends StatelessWidget {
  const NullWidget({super.key});
  @override
  Widget build(BuildContext context) => Material();
}

class SearchResultsList extends StatelessWidget {
  final double width;
  final int? index;
  final List<String> list;

  const SearchResultsList({
    super.key,
    this.index,
    required this.width,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? NullWidget()
        : Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.symmetric(horizontal: BorderSide(width: 1)),
            borderRadius: BorderRadius.all(Radius.circular(1)),
          ),
          width: width,
          height: 500,
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SearchResultTile(
                selected: this.index == index,
                child: Text(list[index], overflow: TextOverflow.ellipsis),
              );
            },
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
