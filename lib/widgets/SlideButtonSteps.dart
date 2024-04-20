import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideButtonSteps extends StatelessWidget {
  int steps;
  double currentStep;
  Function change;
  String title;
  SlideButtonSteps({super.key,required this.steps,required this.currentStep,required this.change,required this.title});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: currentStep,
      min: 0,
      max: steps.toDouble(),
      divisions: steps,
      label: title,
      onChanged: (double value) {
        change(value.toInt());
      },
    );
  }
}
