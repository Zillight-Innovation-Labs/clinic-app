import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function() onTap;

  const HomeCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height * 0.155,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> cardData = [
  {"imagePath": "assets/images/diagnostics.png", "title": "Tests"},
  {"imagePath": "assets/images/nursing.png", "title": "Talk to\nDoctor"},
  {"imagePath": "assets/images/ambulance.png", "title": "Appointment"},
  {"imagePath": "assets/images/pharmacy.png", "title": "Medication"},
];
