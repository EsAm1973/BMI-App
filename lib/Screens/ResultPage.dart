import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, this.weight, this.height});
  final int? weight;
  final double? height;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmi = 0;
  String status = '';
  String message = '';
  String message2 = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateBMI();
  }

  void calculateBMI() {
    if (widget.weight != null && widget.height != null && widget.height! > 0) {
      double heightInMeters = widget.height! / 100;
      bmi = widget.weight! / (heightInMeters * heightInMeters);

      if (bmi < 18.5) {
        status = 'UNDERWEIGHT';
        message = 'You have a under weight body';
        message2 = 'Organize your diet to gain weight';
      } else if (bmi >= 18.5 && bmi < 25.0) {
        status = 'NORMAL';
        message = 'You have a normal weight body';
        message2 = 'Great Job';
      } else if (bmi >= 25.0 && bmi <= 29.9) {
        status = 'OVERWEIGHT';
        message = 'You have a over weight body';
        message2 = 'Organize your diet to lose weight';
      } else if (bmi >= 30.0) {
        status = 'OBESE';
        message = 'You have a obese body';
        message2 = 'Organize your diet to lose excess weight';
      }
    } else {
      status = 'Invalid Input';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 23, 32, 36),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Result',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 100,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      message2,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(4),
                      backgroundColor: Colors.red.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text('RE-CALCULATE',
                      style: TextStyle(fontSize: 35)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
