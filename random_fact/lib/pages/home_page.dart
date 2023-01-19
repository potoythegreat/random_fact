import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:async';
import '../widgets/loading_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? number;
  bool isLoaded = true;
  bool isStart = true;

  String text =
      'Click the button below to generate a random number fact from 1-100.';

  Future<void> getFact() async {
    setState(() {
      isLoaded = false;
    });
    number = Random().nextInt(101);
    var response = await get(Uri.parse("http://numbersapi.com/$number"));
    setState(() {
      isStart = false;
      isLoaded = true;
      text = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Random Fact Generator (1-100)',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: isLoaded,
                replacement: const LoadingScreen(),
                child: SizedBox(
                  width: 300,
                  height: 200,
                  child: numberFact(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  getFact();
                },
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Generate a random "number" fact',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numberFact() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Visibility(
          visible: isStart,
          replacement: Text(
            '# $number',
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
          child: Container(),
        ),
        Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
