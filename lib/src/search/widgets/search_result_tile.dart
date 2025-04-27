// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:flutter/material.dart';

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
