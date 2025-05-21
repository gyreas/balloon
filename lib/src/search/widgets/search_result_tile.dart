// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:flutter/material.dart';

class SearchResultTile extends StatelessWidget {
  final String content;
  final bool isSelected;
  final GestureTapCallback? onTap;

  const SearchResultTile({
    super.key,
    this.isSelected = false,
    this.onTap,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          titleAlignment: ListTileTitleAlignment.center,
          minTileHeight: 44,
          selected: isSelected,
          focusColor: Color.lerp(Theme.of(context).focusColor, Colors.white, 0.8),
          hoverColor: Color.lerp(Theme.of(context).hoverColor, Colors.white, 0.9),
          tileColor: Colors.white,
          selectedTileColor: Theme.of(context).focusColor,
          onTap: onTap,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 11,
                fontWeight:
                    isSelected ? FontWeight.w500 : FontWeight.w400,
                color: Theme.of(context).primaryColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
