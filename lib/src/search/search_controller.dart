// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'dart:async';

import 'package:flutter/material.dart';

class SearchController with ChangeNotifier {
  final List<String> locations;
  List<String> _filteredItems = [];

  String _query = '';

  final Duration _debounce = const Duration(milliseconds: 200);
  Timer? _debounceTimer;

  SearchController({required this.locations}) {
    _filteredItems = locations; // show all locations first
  }

  List<String> get filteredItems => _filteredItems;
  String get query => _query;

  void updateQuery(String newQuery) {
    _query = newQuery;

    _startDebounceTimer();
  }

  void _startDebounceTimer() {
    // reset the debounce unconditionally
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer.periodic(_debounce, (timer) {
      _search();
    });
  }

  void _search() {
    _filteredItems =
        _query.isEmpty
            ? []
            : _filteredItems =
                locations
                    .where(
                      (item) =>
                          item.toLowerCase().contains(_query.toLowerCase()),
                    )
                    .toList();

    notifyListeners();
  }
}
