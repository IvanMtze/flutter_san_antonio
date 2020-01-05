import 'package:flutter/material.dart';
import 'package:flutter_san_antonio/Screen/Resumen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return Resumen();
  }
}
