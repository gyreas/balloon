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
  late final SearchController searchbarController;

  @override
  void initState() {
    super.initState();
    searchbarController = SearchController(locations: loadN(444));
    searchbarController.addListener(() {});
  }

  @override
  void dispose() {
    searchbarController.dispose();
    super.dispose();
  }

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

            return Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListenableBuilder(
                    listenable: searchbarController,
                    builder:
                        (context, child) => SearchBar(
                          prompt: "Search...",
                          radius: 12,
                          width: searchbarWidth,
                          searchController: searchbarController,
                        ),
                  ),
                  ListenableBuilder(
                    listenable: searchbarController,
                    builder:
                        (context, child) => SearchResultsList(
                          width: searchbarWidth,
                          wasQueryEmpty: searchbarController.query.isEmpty,
                          // TODO: inefficient
                          list: searchbarController.filteredItems,
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

class SearchBar extends StatelessWidget {
  final String prompt;
  final double width;
  final double radius;
  final SearchController searchController;

  const SearchBar({
    super.key,
    this.prompt = "Search...",
    this.radius = 4,
    required this.width,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      width: width,
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: prompt,
          fillColor: Colors.amber,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
        onChanged: (query) {
          searchController.updateQuery(query);
        },
      ),
    );
  }
}

class SearchController with ChangeNotifier {
  final List<String> locations;
  List<String> _filteredItems = [];

  String _query = '';

  SearchController({required this.locations}) {
    _filteredItems = locations; // show all locations first
  }

  List<String> get filteredItems => _filteredItems;
  String get query => _query;

  void updateQuery(String newQuery) {
    _query = newQuery;
    _search();
  }

  void _search() {
    if (_query.isEmpty) {
      _filteredItems = [];
    } else {
      _filteredItems =
          locations
              .where(
                (item) => item.toLowerCase().contains(_query.toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }
}

// NullWidget

class NullWidget extends StatelessWidget {
  const NullWidget({super.key});
  @override
  Widget build(BuildContext context) => Material();
}

// Results List

class SearchResultsList extends StatefulWidget {
  final double width;
  final bool wasQueryEmpty;
  final List<String> list;

  const SearchResultsList({
    super.key,
    required this.wasQueryEmpty,
    required this.width,
    required this.list,
  });

  @override
  State<StatefulWidget> createState() => _SearchResultsListState();
}

class _SearchResultsListState extends State<SearchResultsList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theList = widget;
    if (theList.wasQueryEmpty) {
      _selectedIndex = 0;
    }

    return theList.list.isEmpty
        ? NullWidget()
        : Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.symmetric(horizontal: BorderSide(width: 1)),
            borderRadius: BorderRadius.all(Radius.circular(1)),
          ),
          width: theList.width,
          height: 500,
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: theList.list.length,
            itemBuilder: (context, index) {
              return SearchResultTile(
                isSelected: _selectedIndex == index,
                onTap: () => setState(() => _selectedIndex = index),
                child: Text(
                  theList.list[index],
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
        );
  }
}

// Result Tile

class SearchResultTile extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final GestureTapCallback? onTap;

  const SearchResultTile({
    super.key,
    this.isSelected = false,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: isSelected ? Border.all(width: 1) : Border.all(width: 0),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        margin: const EdgeInsets.only(top: 3, bottom: 4, left: 14, right: 14),
        height: 44,
        alignment: Alignment.center,
        child: ListTile(
          title: child,
          selected: isSelected,
          selectedTileColor: Colors.cyan,
          onTap: onTap,
        ),
      ),
    );
  }
}
