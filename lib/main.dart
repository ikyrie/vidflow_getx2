import 'package:flutter/material.dart';
import 'package:vidflow/screens/dashboard.dart';
import 'package:vidflow/screens/login.dart';
import 'package:vidflow/screens/upload.dart';

void main() {
  runApp(const VidFlow());
}

class VidFlow extends StatelessWidget {
  const VidFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VidFlow",
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blueAccent,
      ),
      home: Upload(),
    );
  }
}
