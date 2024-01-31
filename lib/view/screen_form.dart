import 'package:flutter/material.dart';
import 'package:seruapp/view/first_screen.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  int _index = 0;

  List<Step> steps() => [
    Step(
      isActive: _index >= 0,
      title: const Text('Step 1'),
      content: const FormScreen()
    ),
    Step(
      isActive: _index >= 1,
      title: const Text('Step 2'),
      content: Text('Content 2'),
    ),
    Step(
      isActive: _index >= 2,
      title: const Text('Step 3'),
      content: Text('Content 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _index,
        steps: steps(),
        onStepContinue: () {
          if (_index < steps().length - 1) {
            setState(() {
              _index++;
            });
          }
        },
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index--;
            });
          }
        },
      )
    );
  }
}