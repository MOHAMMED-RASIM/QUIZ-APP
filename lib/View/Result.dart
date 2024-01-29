import 'package:flutter/material.dart';
import 'package:quiz/View/Homepage.dart';
import 'package:quiz/View/Splash.dart';
import 'package:quiz/ViewModel/FetchAPI.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 66, 2, 77),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'YOUR SCORE',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Center(
              child: Text(
                "${mark}/5",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Splash()));
                 
          
                },
                child: Text("Start Again"))
          ],
        ),
      ),
    );
  }
}
