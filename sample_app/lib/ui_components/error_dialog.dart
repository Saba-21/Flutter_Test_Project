import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(this.retry, {Key? key}) : super(key: key);

  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'An error occurred when fetching the posts.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: retry,
            child: const Text(
              "Retry",
              style: TextStyle(
                fontSize: 20,
                color: Colors.purpleAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
