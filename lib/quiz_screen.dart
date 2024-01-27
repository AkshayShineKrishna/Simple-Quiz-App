import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';

import 'pageone.dart';

class QuizScreen extends StatefulWidget {
  final String? userName;

  const QuizScreen({super.key, this.userName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? selectedAns;

  int score = 0;
  int correct = 0;

  List<Map> questions = [
    {
      'q': "Which method can be defined only once in a program?",
      'op': [
        "finalize method",
        "main method",
        "static method",
        "private method"
      ],
      'ans': "main method"
    },
    {
      'q':
          "Which keyword is used by method to refer to the current object that invoked it?",
      'op': ["import", "this", "catch", "abstract"],
      'ans': "this"
    },
    {
      'q': "Which of these access specifiers can be used for an interface?",
      'op': ["public", "protected", "private", "All of the mentioned"],
      'ans': "public"
    },
    {
      'q':
          "Which of the following is correct way of importing an entire package 'pkg' ?",
      'op': ["Import pkg.", "import pkg.*", "Import pkg.*", "import pkg."],
      'ans': "import pkg.*"
    },
    {
      'q': "What is the return type of Constructors ?",
      'op': ["int", "float", "void", "None of the mentioned"],
      'ans': "None of the mentioned"
    }
  ];
  var i = 0;
  var display;
  @override
  void initState() {
    display = current(0);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Quiz Hub"),
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hello ${widget.userName!}!",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                display[0],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                  activeColor: Colors.red,
                  title: Text(display[1]),
                  value: display[1],
                  groupValue: selectedAns,
                  onChanged: (value) {
                    setState(() {
                      selectedAns = display[1];
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                  activeColor: Colors.red,
                  title: Text(display[2]),
                  value: display[2],
                  groupValue: selectedAns,
                  onChanged: (value) {
                    setState(() {
                      selectedAns = display[2];
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                  activeColor: Colors.red,
                  title: Text(display[3]),
                  value: display[3],
                  groupValue: selectedAns,
                  onChanged: (value) {
                    setState(() {
                      selectedAns = display[3];
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                  activeColor: Colors.red,
                  title: Text(display[4]),
                  value: display[4],
                  groupValue: selectedAns,
                  onChanged: (value) {
                    setState(() {
                      selectedAns = display[4];
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkAns();
                              i++;
                              display = current(i);
                            });
                          },
                          child: const Text("Next Question")),
                    ),
                    SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                            child: const Text('Quit'))),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Score",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$score",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
              // Image.asset("assets/images/progress.jpg")
            ],
          ),
        )));
  }

  Future<void> checkAns() async {
    if (i <= 3) {
      validateAns();
    } else {
      validateAns();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              resultScreen(totalScore: score, correctAns: correct)));
    }
  }

  void validateAns() {
    if (selectedAns == display[5]) {
      score += 5;
      correct++;
      final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
              title: 'Yay! correct answer',
              message: "Score +5",
              contentType: ContentType.success));
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
              title: 'Oops wrong answer!',
              message: "'${display[5]}' was the correct answer",
              contentType: ContentType.failure));
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  List<void> current(int cq) {
    var element = questions[cq];
    var question = element['q'];
    var opList = element['op'];
    var ans = element['ans'];
    var op1 = opList[0];
    var op2 = opList[1];
    var op3 = opList[2];
    var op4 = opList[3];
    return [question, op1, op2, op3, op4, ans];
  }
}
