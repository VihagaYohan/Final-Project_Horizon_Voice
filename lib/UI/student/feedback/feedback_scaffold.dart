import 'package:feedback_app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/widgets/elevated_botton.dart';
import 'package:feedback_app/widgets/rate_button.dart';
import 'package:easy_stepper/easy_stepper.dart';

class FeedbackForm extends StatefulWidget {
  final List<String> questions;
  final String appBarTitle;
  final String firebaseCollection;

  FeedbackForm({
    required this.questions,
    required this.appBarTitle,
    required this.firebaseCollection,
  });

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  int activeStep = 0;
  late Map<int, int> rates;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String faculty = AppConfigs.faculties[0];

  @override
  void initState() {
    super.initState();
    // Initialize rates map
    rates = Map<int, int>.fromIterable(
      List.generate(widget.questions.length, (index) => index),
      key: (index) => index,
      value: (_) => -1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        elevation: 0,
        foregroundColor: Colors.purple,
        backgroundColor: Colors.white,
        actions: [
          DropdownButton<String>(
            value: faculty,
            underline: Container(),
            onChanged: (newValue) {
              setState(() {
                faculty = newValue!;
              });
            },
            items:AppConfigs.faculties
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EasyStepper(
              activeStep: activeStep,
              steps: widget.questions
                  .map(
                    (question) => EasyStep(
                      customStep: CircleAvatar(
                        radius: 20,
                        backgroundColor: activeStep >=
                                widget.questions.indexOf(question)
                            ? Colors.purple
                            : Colors.grey,
                        child: Text(
                          (widget.questions.indexOf(question) + 1).toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onStepReached: (index) => setState(() => activeStep = index),
            ),
            Center(
              child: Text(
                widget.questions[activeStep],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RateButton(
                  icon: Icons.sentiment_very_satisfied,
                  isActive: rates[activeStep] == 5,
                  onPressed: () {
                    setState(() {
                      rates[activeStep] = 5;
                    });
                  },
                ),
                RateButton(
                  icon: Icons.sentiment_satisfied,
                  isActive: rates[activeStep] == 4,
                  onPressed: () {
                    setState(() {
                      rates[activeStep] = 4;
                    });
                  },
                ),
                RateButton(
                  icon: Icons.sentiment_neutral,
                  isActive: rates[activeStep] == 3,
                  onPressed: () {
                    setState(() {
                      rates[activeStep] = 3;
                    });
                  },
                ),
                RateButton(
                  icon: Icons.sentiment_dissatisfied,
                  isActive: rates[activeStep] == 2,
                  onPressed: () {
                    setState(() {
                      rates[activeStep] = 2;
                    });
                  },
                ),
                RateButton(
                  icon: Icons.sentiment_very_dissatisfied,
                  isActive: rates[activeStep] == 1,
                  onPressed: () {
                    setState(() {
                      rates[activeStep] = 1;
                    });
                  },
                ),
              ],
            ),
            UIButton(
              onPressed: () async {
                if (activeStep == widget.questions.length - 1) {
                  await saveFeedbackToFirestore();
                  Navigator.pop(context);
                } else {
                  setState(() {
                    activeStep++;
                  });
                }
              },
              label: activeStep == widget.questions.length - 1 ? 'Save' : 'Next',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveFeedbackToFirestore() async {
    try {
      final Map<String, dynamic> feedbackData = {};
      rates.forEach((index, rate) {
        feedbackData[index.toString()] = rate;
      });
      await db.collection('feedbacks/$faculty/${widget.firebaseCollection}').add(feedbackData);
    } catch (e) {
      print('Error saving feedback: $e');
      // Handle error
    }
  }
}
