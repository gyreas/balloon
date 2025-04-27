// MIT License
// Copyright (c) 2025 Saheed Adeleye <aadesaed@gmail.com>
// See LICENSE file in the project root for full license information.

import 'package:balloon/src/search/widgets/search_screen.dart'
    show SearchScreen;
import 'package:flutter/material.dart';

void main() {
  runApp(Balloon());
}

const int minSupportedScreenWidth = 200;

class Balloon extends StatelessWidget {
  const Balloon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: SearchScreen()));
  }
}
