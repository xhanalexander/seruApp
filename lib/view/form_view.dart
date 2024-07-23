import 'package:flutter/material.dart';

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
      content: const MainForm()
    ),
    /* Step(
      isActive: _index >= 1,
      title: const Text('Step 2'),
      content: const FormScreenSecond()
    ),
    Step(
      isActive: _index >= 2,
      title: const Text('Step 3'),
      content: const FormScreenThird()
    ), */
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        controlsBuilder: (context, details) => Container(),
        currentStep: _index,
        steps: steps(),
        onStepTapped: (index) => setState(() => _index = index),
        elevation: 1,
        onStepContinue: () {
          if (_index < steps().length - 1) {
            setState(() => _index++);
          }
        },
      )
    );
  }
}