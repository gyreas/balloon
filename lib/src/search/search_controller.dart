// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'dart:async';

import 'package:flutter/material.dart';

class SearchController with ChangeNotifier {
  // metadata sources e.g filesystems, phonebooks, textfiles, etc
  final List<String> locations;
  List<String> _filteredItems = [];

  String _query = '';
  bool _isLoading = false;
  final Duration _debounce = const Duration(milliseconds: 200);
  Timer? _debounceTimer;

  SearchController({required this.locations}) {
    _filteredItems = locations; // show all locations first
  }

  bool get isLoading => _isLoading;
  List<String> get filteredItems => _filteredItems;
  String get query => _query;

  void updateQuery(String newQuery) {
    _query = newQuery;
    if (_query.isEmpty) {
      _isLoading = false;
      notifyListeners();
    } else {
      _startDebounceTimer();
    }
  }

  void _startDebounceTimer() {
    // reset the debounce unconditionally
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounce, () {
      _search();
    });
  }

  void _search() {
    _isLoading = true;
    notifyListeners();

    Future.delayed(Duration(milliseconds: 444), () {
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

      _isLoading = false;
      notifyListeners();
    });
  }
}
