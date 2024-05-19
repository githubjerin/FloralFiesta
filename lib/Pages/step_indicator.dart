import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({Key? key, required this.currentStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStep(context, '1', 'Address', isActive: currentStep >= 1),
        _buildStep(context, '2', 'Order Summary', isActive: currentStep >= 2),
        _buildStep(context, '3', 'Payment', isActive: currentStep >= 3),
      ],
    );
  }

  Widget _buildStep(BuildContext context, String stepNumber, String stepTitle, {bool isActive = false}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: isActive ? Colors.green : Colors.grey,
          child: Text(
            stepNumber,
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 5),
        Text(
          stepTitle,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
