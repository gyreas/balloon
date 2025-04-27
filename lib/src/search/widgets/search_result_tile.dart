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
    return SizedBox(
      height: 33,
      child: ListTile(
        minTileHeight: 24,
        minLeadingWidth: 80,
        contentPadding: EdgeInsets.all(1),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: child,
        ),
        selected: isSelected,
        selectedTileColor: Colors.lightBlue,
        onTap: onTap,
      ),
    );
  }
}
