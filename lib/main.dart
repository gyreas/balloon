// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:flutter/material.dart';

import 'src/core/themes/light.dart' show lightTheme;
import 'src/search/widgets/search_screen.dart' show SearchScreen;

void main() {
  runApp(Balloon());
}

class Balloon extends StatelessWidget {
  const Balloon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SearchScreen(),
      ),
    );
  }
}
