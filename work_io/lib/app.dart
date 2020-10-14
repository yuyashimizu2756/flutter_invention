import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:myDental/pages/components/fixed_text_scale_factor.dart';

// import 'pages/splash_screen.dart';
// import 'utils/japanese_cupertino_localizations.dart';
// import 'utils/styles.dart';
import 'blocs/flavor_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final flavor = FlavorProvider.of(context);
    print(flavor.toString());
    return MaterialApp(
      home: Text('Hello'),
    );
  }
}
