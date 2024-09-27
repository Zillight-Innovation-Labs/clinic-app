import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kivicare_patient/utils/colors.dart';

class HomeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color color;
  final Function() onTap;

  const HomeCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    required this.color,
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
            color: color,
        
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(imagePath),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
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
