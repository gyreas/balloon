// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:flutter/material.dart';

import '../../core/widgets/null_widget.dart' show NullWidget;
import 'search_result_tile.dart' show SearchResultTile;

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
