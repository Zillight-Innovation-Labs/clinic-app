import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/models/exercise_model.dart';
import 'package:kivicare_patient/providers/profile_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class OutdoorRunningScreen extends StatefulWidget {
  final Exercise exercise;
  const OutdoorRunningScreen({Key? key, required this.exercise})
      : super(key: key);

  @override
  State<OutdoorRunningScreen> createState() => _OutdoorRunningScreenState();
}

class _OutdoorRunningScreenState extends State<OutdoorRunningScreen> {
  TimeOfDay? selectedTime;
  String? time;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        time = selectedTime!.format(context).toString();
      });
    }
    if (time != null) {
      toast("OutDoor Running Reminder set to $time everday");
      context.read<ProfileProvider>().postExercise(
            exerciseId: widget.exercise.id.toString(),
            exerciseTime: time!,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: kLikeWhiteColor,
        elevation: 0,
        leading: BackButton(
          color: kTitleColor,
        ),
        title: Text(
          "Outdoor Running",
          style: ktitleTextStyle,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppButton(
          text: "Set a reminder",
          textColor: kLikeWhiteColor,
          elevation: 0,
          color: kMainColor,
          onTap: () async {
            _selectTime(context);
          },
          //  padding: EdgeInsets.zero,
          shapeBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 4.0,
              percent: 0.4,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/run.png",
                    width: 44,
                  ),
                  const Text(
                    "30 Min - 1.0 KM",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  // Text(
                  //   "Running",
                  //   style: TextStyle(color: kSubTitleColor),
                  // ),
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: kMainColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kbigContainerColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/meter.png"),
                    Center(
                      child: Text(
                        time == null ? "00:00" : '${time!} - Daily',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("🔥0000",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "❤0000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
