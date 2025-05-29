// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:flutter/material.dart';

import '../../core/widgets/null_widget.dart' show NullWidget;
import 'result_tile.dart' show SearchResultTile;

class SearchResultsList extends StatefulWidget {
  final double width;
  final double height;
  final bool wasQueryEmpty;
  final List<String> list;

  const SearchResultsList({
    super.key,
    required this.wasQueryEmpty,
    required this.width,
    required this.height,
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

    const double gapHeight = 2;
    return theList.list.isEmpty
        ? NullWidget()
        : Material(
          child: SizedBox(
            width: theList.width,
            height: theList.height,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: theList.list.length,
              reverse: true,
              itemBuilder: (context, index) {
                bool isSelected = _selectedIndex == index;
                var searchTile = Column(
                  children: [
                    index == 0 ? NullWidget() : SizedBox(height: gapHeight),
                    SearchResultTile(
                      isSelected: isSelected,
                      onTap: () => setState(() => _selectedIndex = index),
                      content: theList.list[index],
                    ),
                    SizedBox(height: gapHeight),
                  ],
                );

                return searchTile;
              },
            ),
          ),
        );
  }
}
