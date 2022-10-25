import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'elevatedButtonProvider/view/ElevetatedView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'glyadgzl',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
        ),
      ),
      home: const ProviderButton(),
    );
  }
}
