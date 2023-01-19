import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Loading',
                style: TextStyle(
                  fontSize: 25,
                ),
              )),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
