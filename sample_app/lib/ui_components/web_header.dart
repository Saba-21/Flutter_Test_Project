import 'package:flutter/material.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      color: const Color(0xFFFDFDFE),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/wallpaper.png'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Rick and Morty API',
              style: TextStyle(
                color: Color(0xFF20232A),
                fontWeight: FontWeight.bold,
                fontSize: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
