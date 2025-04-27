// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:flutter/material.dart';

import '../search_controller.dart' as sctrl;
import '../search_data.dart' show loadN;
import 'search_bar.dart' as sbar;
import 'search_results_list.dart' show SearchResultsList;

const int _minSupportedScreenWidth = 200;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final sctrl.SearchController searchbarController;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      var searchbarWidth = constraints.maxWidth * .8;

      return constraints.maxWidth <= _minSupportedScreenWidth
          ? Align(child: Text("Too small"))
          : Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListenableBuilder(
                  listenable: searchbarController,
                  builder:
                      (context, child) => sbar.SearchBar(
                        width: searchbarWidth,
                        searchController: searchbarController,
                      ),
                ),
                SizedBox(height: 10),
                ListenableBuilder(
                  listenable: searchbarController,
                  builder:
                      (context, child) =>
                          searchbarController.isLoading
                              ? CircularProgressIndicator(
                                color: Colors.cyanAccent,
                              )
                              : SearchResultsList(
                                width: searchbarWidth,
                                wasQueryEmpty:
                                    searchbarController.query.isEmpty,
                                // TODO: inefficient
                                list: searchbarController.filteredItems,
                              ),
                ),
              ],
            ),
          );
    },
  );

  @override
  void dispose() {
    searchbarController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    searchbarController = sctrl.SearchController(locations: loadN(444));
    searchbarController.addListener(() {});
  }
}
