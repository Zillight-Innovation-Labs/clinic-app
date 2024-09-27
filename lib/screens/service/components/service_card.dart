import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.title,
    required this.desc,
    required this.onTap,
    required this.color,
    required this.img,
    this.hasButton = true,
  });

  final String title;
  final String desc;
  final void Function()? onTap;
  final Color color;
  final String img;
  final bool hasButton;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.only(top: 18, left: 18),
      height: size.height * 0.22,
      width: size.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage("assets/images/polygon.png")),
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: primaryTextStyle(color: Colors.white),
              ),
              const SizedBox(height: 7),
              SizedBox(
                width: size.width * 0.65,
                child: Text(
                  desc,
                  style: secondaryTextStyle(
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (hasButton) ...{
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Book Now",
                      style: TextStyle(color: color, fontSize: 12),
                    ),
                  ),
                )
              }
            ],
          ),
          Positioned(
            right: hasButton ? 0 : -30,
            bottom: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(18)),
              child: Image.asset(
                img,
              ),
            ),
          )
        ],
      ),
    );
  }
}
//