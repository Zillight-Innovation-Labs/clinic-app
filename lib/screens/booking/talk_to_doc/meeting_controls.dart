import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MeetingControls extends StatelessWidget {
  final void Function()? onToggleMicButtonPressed;
  final void Function()? onToggleCameraButtonPressed;
  final void Function()? onLeaveButtonPressed;
  final void Function()? onEndButtonPressed;
  const MeetingControls({
    Key? key,
    this.onToggleMicButtonPressed,
    this.onToggleCameraButtonPressed,
    this.onLeaveButtonPressed,
    this.onEndButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: onToggleMicButtonPressed,
          child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white38,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  "assets/icons/off-microphone-slash.svg",
                ),
              )),
        ),
        GestureDetector(
          onTap: onEndButtonPressed,
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red[900],
              ),
              child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.phone_enabled_rounded)
                  //  SvgPicture.asset(
                  //   "assets/icons/call.svg",
                  // ),
                  )),
        ),
        GestureDetector(
          onTap: onToggleCameraButtonPressed,
          child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white38,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  "assets/icons/off-video-slash.svg",
                ),
              )),
        ),

        // ElevatedButton(
        //     onPressed: onLeaveButtonPressed, child: const Text('Leave')),
        // ElevatedButton(
        //     onPressed: onToggleMicButtonPressed, child: const Text('Toggle Mic')),
        // ElevatedButton(
        //     onPressed: onToggleCameraButtonPressed,
        //     child: const Text('Toggle WebCam')),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
