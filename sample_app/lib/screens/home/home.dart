import 'package:flutter/material.dart';
import 'package:sample_app/screens/home/characters.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272B34),
      appBar: getAppBar(),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: const CharacterList(),
      ),
    );
  }

  PreferredSizeWidget? getAppBar() {
    if (kIsWeb) {
      return null;
    } else {
      return AppBar(
        backgroundColor: const Color(0xFFFDFDFE),
        title: const Text(
          'Rick and Morty API',
          style: TextStyle(color: Color(0xFF20232A), fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}
