import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quiz/ViewModel/FetchAPI.dart';
import 'package:quiz/Model/Quizmodel.dart';
import 'package:quiz/View/Result.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

int indexadd = 0;
int? selectedIndex;
final countdown = CountDownController();
int mark = 0;

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 66, 2, 77),
        body: FutureBuilder<List<Quiz>>(
            future: fetchQuiz(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 100),
                          child: CircularCountDownTimer(
                            controller: countdown,
                            width: 100,
                            height: 100,
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 30),
                            duration: 10,
                            fillColor: Colors.white,
                            ringColor: Colors.red,
                            isReverse: true,
                            isReverseAnimation: true,
                            autoStart: true,
                            onComplete: () {
                              setState(() {
                                if (indexadd <= 3) {
                                  indexadd++;
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Result(),
                                      ));
                                }
                                selectedIndex = null;
                                countdown.restart();
                              });
                            },
                          ),
                        ),
                        Text(
                          "${snapshot.data?[indexadd].question}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  selectedIndex = index;
                                  snapshot.data?[indexadd].options[index]
                                              .isCorrect ==
                                          true
                                      ? mark++
                                      : mark;

                                      
                                },
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),

                                    color: selectedIndex == index
                                        ? (snapshot.data?[indexadd]
                                                    .options[index].isCorrect ==
                                                true
                                            ? Colors
                                                .green // Correct answer turns green

                                            : Colors
                                                .red) // Incorrect answer turns red
                                        : Colors
                                            .transparent, // Default color for unselected options
                                  ),
                                  child: customtext(
                                      text:
                                          "${snapshot.data?[indexadd].options[index].text}"),
                                ),
                              ),
                            );
                          },
                          itemCount: 4,
                          shrinkWrap: true,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (indexadd <= 3) {
                                  indexadd++;
                                  selectedIndex = null;
                                  countdown.restart();
                                } else {
                                  (Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Result())));
                                }
                              });
                            },
                            child: const Text("Next")),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

customtext({text}) {
  return Text(
    '$text',
    style: const TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
  );
}
