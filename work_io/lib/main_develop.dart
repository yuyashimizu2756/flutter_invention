import 'dart:async';

import 'package:flutter/material.dart';

import 'app.dart';
import 'blocs/flavor_provider.dart';

///
/// エントリポイント(開発)
///
void main() {
  runZoned(
    () {
      runApp(
        FlavorProvider(
          flavor: FlavorType.develop,
          child: App(),
        ),
      );
    },
  );
}
