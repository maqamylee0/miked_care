import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_kit/survey_kit.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.center,
        child: FutureBuilder<Task>(
          future: getJsonTask(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData &&
                snapshot.data != null) {
              final task = snapshot.data!;
              return SurveyKit(
                onResult: (SurveyResult result) {
                  print(result.finishReason);
                  Navigator.pushNamed(context, '/');
                },
                task: task,
                showProgress: true,
                localizations: {
                  'cancel': 'Cancel',
                  'next': 'Next',
                },

                themeData: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: Colors.cyan,
                  ).copyWith(
                    onPrimary: Colors.white,
                  ),
                  primaryColor:  Color(0xFF16E4E4),
                  backgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    color: Colors.white,
                    iconTheme: IconThemeData(
                      color:  Color(0xFF16E4E4),
                    ),
                    titleTextStyle: TextStyle(
                      color:  Color(0xFF16E4E4),
                    ),
                  ),
                  iconTheme: const IconThemeData(
                    color:  Color(0xFF16E4E4),
                  ),
                  textSelectionTheme: const TextSelectionThemeData(

                    cursorColor: Color(0xFF16E4E4),
                    selectionColor:  Color(0xFF16E4E4),
                    selectionHandleColor:  Color(0xFF16E4E4),
                  ),
                  cupertinoOverrideTheme: const CupertinoThemeData(
                    primaryColor:  Color(0xFF16E4E4),
                  ),

                  outlinedButtonTheme: OutlinedButtonThemeData(

                    style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF16E4E4)),
                      minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width*0.8, 60.0),
                      ),
                      side: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                          if (state.contains(MaterialState.disabled)) {
                            return const BorderSide(
                              color: Colors.grey,
                            );
                          }
                          return BorderSide(
                            color:  Color(0xFF16E4E4),
                          );
                        },
                      ),
                      shape: MaterialStateProperty.all(

                        RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      textStyle: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                          if (state.contains(MaterialState.disabled)) {
                            return Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(
                              color: Colors.white,
                            );
                          }
                          return Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        Theme.of(context).textTheme.button?.copyWith(
                          color:  Colors.white,
                        ),
                      ),
                    ),
                  ),
                  textTheme: const TextTheme(
                    headline2: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    headline5: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    bodyText2: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                    subtitle1: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),

                surveyProgressbarConfiguration: SurveyProgressConfiguration(
                  backgroundColor: Colors.white,
                ),
              );
            }
            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
    );

  }

  // Future<Task> getSampleTask() {
  //   var task = NavigableTask(
  //     id: TaskIdentifier(),
  //     steps: [
  //       InstructionStep(
  //         title: 'Welcome to the\nQuickBird Studios\nHealth Survey',
  //         text: 'Get ready for a bunch of super random questions!',
  //         buttonText: 'Let\'s go!',
  //       ),
  //       QuestionStep(
  //         title: 'How old are you?',
  //         answerFormat: IntegerAnswerFormat(
  //           defaultValue: 25,
  //           hint: 'Please enter your age',
  //         ),
  //         isOptional: true,
  //       ),
  //       QuestionStep(
  //         title: 'Medication?',
  //         text: 'Are you using any medication',
  //         answerFormat: BooleanAnswerFormat(
  //           positiveAnswer: 'Yes',
  //           negativeAnswer: 'No',
  //           result: BooleanResult.POSITIVE,
  //         ),
  //       ),
  //       QuestionStep(
  //         title: 'Tell us about you',
  //         text:
  //         'Tell us about yourself and why you want to improve your health.',
  //         answerFormat: TextAnswerFormat(
  //           maxLines: 5,
  //           validationRegEx: "^(?!\s*\$).+",
  //         ),
  //       ),
  //       QuestionStep(
  //         title: 'Select your body type',
  //         answerFormat: ScaleAnswerFormat(
  //           step: 1,
  //           minimumValue: 1,
  //           maximumValue: 5,
  //           defaultValue: 3,
  //           minimumValueDescription: '1',
  //           maximumValueDescription: '5',
  //         ),
  //       ),
  //       QuestionStep(
  //         title: 'Known allergies',
  //         text: 'Do you have any allergies that we should be aware of?',
  //         isOptional: false,
  //         answerFormat: MultipleChoiceAnswerFormat(
  //           textChoices: [
  //             TextChoice(text: 'Penicillin', value: 'Penicillin'),
  //             TextChoice(text: 'Latex', value: 'Latex'),
  //             TextChoice(text: 'Pet', value: 'Pet'),
  //             TextChoice(text: 'Pollen', value: 'Pollen'),
  //           ],
  //         ),
  //       ),
  //       QuestionStep(
  //         title: 'Done?',
  //         text: 'We are done, do you mind to tell us more about yourself?',
  //         isOptional: true,
  //         answerFormat: SingleChoiceAnswerFormat(
  //           textChoices: [
  //             TextChoice(text: 'Yes', value: 'Yes'),
  //             TextChoice(text: 'No', value: 'No'),
  //           ],
  //           defaultSelection: TextChoice(text: 'No', value: 'No'),
  //         ),
  //       ),
  //       QuestionStep(
  //         title: 'When did you wake up?',
  //         answerFormat: TimeAnswerFormat(
  //           defaultValue: TimeOfDay(
  //             hour: 12,
  //             minute: 0,
  //           ),
  //         ),
  //       ),
  //       QuestionStep(
  //         title: 'When was your last holiday?',
  //         answerFormat: DateAnswerFormat(
  //           minDate: DateTime.utc(1970),
  //           defaultDate: DateTime.now(),
  //           maxDate: DateTime.now(),
  //         ),
  //       ),
  //       CompletionStep(
  //         stepIdentifier: StepIdentifier(id: '321'),
  //         text: 'Thanks for taking the survey, we will contact you soon!',
  //         title: 'Done!',
  //         buttonText: 'Submit survey',
  //       ),
  //     ],
  //   );
  //   task.addNavigationRule(
  //     forTriggerStepIdentifier: task.steps[6].stepIdentifier,
  //     navigationRule: ConditionalNavigationRule(
  //       resultToStepIdentifierMapper: (input) {
  //         switch (input) {
  //           case "Yes":
  //             return task.steps[0].stepIdentifier;
  //           case "No":
  //             return task.steps[7].stepIdentifier;
  //           default:
  //             return null;
  //         }
  //       },
  //     ),
  //   );
  //   return Future.value(task);
  // }

  Future<Task> getJsonTask() async {
    var taskMap;

    await rootBundle.loadString('assets/survey.json').then((value) => taskMap = json.decode(value));
    print('hiiiiiiiiiiiiiiiiii $taskMap');
    return Task.fromJson(taskMap);
  }
}
