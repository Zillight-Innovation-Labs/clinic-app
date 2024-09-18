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
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.black),
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
