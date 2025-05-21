// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:flutter/material.dart';

import '../search_controller.dart' as sctrl;

class SearchBar extends StatelessWidget {
  final String prompt;
  final double width;
  final double height;
  final double radius;
  final sctrl.SearchController controller;

  const SearchBar({
    super.key,
    this.prompt = "Search...",
    this.radius = 4,
    required this.width,
    required this.height,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              hintText: prompt,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            onChanged: (query) {
              controller.updateQuery(query);
            },
          ),
        ],
      ),
    );
  }
}
