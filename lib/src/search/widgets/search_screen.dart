// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:flutter/material.dart';

import '../search_controller.dart' as sctrl;
import '../search_data.dart' show loadN;
import 'search_bar.dart' as sbar;
import 'search_results_list.dart' show SearchResultsList;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final sctrl.SearchController controller;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      var searchbarWidth = constraints.maxWidth * .94;

      return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListenableBuilder(
              listenable: controller,
              builder:
                  (context, child) =>
                      controller.isLoading
                          ? CircularProgressIndicator(color: Colors.cyanAccent)
                          : SearchResultsList(
                            width: searchbarWidth,
                            wasQueryEmpty: controller.query.isEmpty,
                            // TODO: inefficient
                            list: controller.filteredItems,
                          ),
            ),
            SizedBox(height: 10),
            ListenableBuilder(
              listenable: controller,
              builder:
                  (context, child) => sbar.SearchBar(
                    width: searchbarWidth,
                    searchController: controller,
                  ),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    },
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = sctrl.SearchController(locations: loadN(444));
    controller.addListener(() {});
  }
}
