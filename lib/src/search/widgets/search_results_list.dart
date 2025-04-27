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
        : Material(
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border.all()),
            child: SizedBox(
              width: theList.width,
              height: 500,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: theList.list.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedIndex == index;
                  return SearchResultTile(
                    isSelected: isSelected,
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Text(
                      theList.list[index],
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight:
                            isSelected ? FontWeight.w500 : FontWeight.w400,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),
          ),
        );
  }
}
