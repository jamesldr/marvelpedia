import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  get privateKey => null;

  get publicKey => null;

  get ts => null;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, o, d) => MaterialApp(
        title: 'Marvelpedia',
        theme: ThemeData(primarySwatch: Colors.red),
      ).modular(),
    );
  }
}
