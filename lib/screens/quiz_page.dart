import 'dart:async';
import 'package:the_quiz_app/screens/result_page.dart';
import 'package:the_quiz_app/utilities/networking.dart';
import 'package:the_quiz_app/utilities/constants.dart';
import 'package:the_quiz_app/utilities/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_quiz_app/screens/result_page.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key, required this.userName}) : super(key: key);

  String? userName;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  var currentQuestionIndex = 0;
  int seconds = 60;
  Timer? timer;
  late Future quiz;

  int points = 0;

  var isLoaded = false;

  var optionsList = [];

  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  @override
  void initState() {
    super.initState();
    quiz = getQuizData();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  Future<void> getQuizData() async {

    NetworkHelper networkHelper = NetworkHelper('https://opentdb.com/api.php?amount=10&category=18');
    return await networkHelper.getData();

  }

  resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          gotoNextQuestion();
        }
      });
    });
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 60;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'images/background.jpg',
            ).image,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: SafeArea(
          child: FutureBuilder(
            future: quiz,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data["results"];

                if (isLoaded == false) {
                  optionsList = data[currentQuestionIndex]["incorrect_answers"];
                  optionsList.add(data[currentQuestionIndex]["correct_answer"]);
                  optionsList.shuffle();
                  isLoaded = true;
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  CupertinoIcons.xmark,
                                  color: Colors.white,
                                  size: 28,
                                )),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              normalText(color: Colors.white, size: 24, text: "$seconds"),
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CircularProgressIndicator(
                                  value: seconds / 60,
                                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                        Image.asset('images/icon.png', width: 200),
                      const SizedBox(height: 20),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: normalText(
                              color: Colors.grey,
                              size: 18,
                              text: "Question ${currentQuestionIndex + 1} of ${data.length}")),
                      const SizedBox(height: 20),
                      normalText(color: Colors.white, size: 20, text: data[currentQuestionIndex]["question"]),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: optionsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var answer = data[currentQuestionIndex]["correct_answer"];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (answer.toString() == optionsList[index].toString()) {
                                  optionsColor[index] = Colors.green;
                                  points = points + 10;
                                } else {
                                  optionsColor[index] = Colors.red;
                                }

                                if (currentQuestionIndex < data.length - 1) {
                                  Future.delayed(const Duration(seconds: 1), () {
                                    gotoNextQuestion();
                                  });
                                } else {
                                  timer!.cancel();
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => ResultPage(userName: widget.userName, userScore: points)));
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              alignment: Alignment.center,
                              width: size.width - 100,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: optionsColor[index],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: headingText(
                                color: kDefaultBlueColor,
                                size: 18,
                                text: optionsList[index].toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
