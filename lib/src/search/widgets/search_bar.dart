// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:flutter/material.dart';

import '../search_controller.dart' as sctrl;

class SearchBar extends StatelessWidget {
  final String prompt;
  final double width;
  final double radius;
  final sctrl.SearchController searchController;

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
          // TODO: this gets overridden within the TextField constructor logic somewhere, so theming is adviced
          border: OutlineInputBorder(),
        ),
        onChanged: (query) {
          searchController.updateQuery(query);
        },
      ),
    );
  }
}
