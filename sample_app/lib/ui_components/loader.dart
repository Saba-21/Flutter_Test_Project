import 'package:flutter/material.dart';

class LoaderIndicator extends StatelessWidget {
  const LoaderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: CircularProgressIndicator(),
    );
  }
}
