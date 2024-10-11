import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/booking/talk_to_doc/meeting_controls.dart';
import 'package:kivicare_patient/screens/booking/talk_to_doc/meeting_tile.dart';
import 'package:videosdk/videosdk.dart';

class VideocallPage extends StatefulWidget {
  final String meetingId;
  final String videoSdkToken;

  const VideocallPage({
    super.key,
    required this.meetingId,
    required this.videoSdkToken,
  });

  @override
  State<VideocallPage> createState() => _VideocallPageState();
}

class _VideocallPageState extends State<VideocallPage> {
  late Room _room;
  var micEnabled = true;
  var camEnabled = true;

  Map<String, Participant> participants = {};

  @override
  void initState() {
    // create room
    _room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.videoSdkToken,
      displayName: "",
      micEnabled: micEnabled,
      camEnabled: camEnabled,
      defaultCameraIndex:
          1, // Index of MediaDevices will be used to set default camera
    );

    setMeetingEventListener();
    // Join room
    _room.join();
    super.initState();
  }

  void setMeetingEventListener() {
    _room.on(Events.roomJoined, () {
      setState(() {
        participants.putIfAbsent(
            _room.localParticipant.id, () => _room.localParticipant);
      });
    });

    _room.on(
      Events.participantJoined,
      (Participant participant) {
        setState(
          () => participants.putIfAbsent(participant.id, () => participant),
        );
      },
    );

    _room.on(Events.participantLeft, (String participantId) {
      if (participants.containsKey(participantId)) {
        setState(
          () => participants.remove(participantId),
        );
      }
    });

    _room.on(Events.roomLeft, () {
      participants.clear();

      // Navigator.of(context).pop();
    });
  }



  @override
  void dispose() {
    // RTCVideoRenderer.dispose;
    super.dispose();
  }

  bool isCallinit = false;

  @override
  Widget build(BuildContext context) {
    // final provider = context.watch<SessionProvider>();

 
    return PopScope(
      canPop:false ,
      child: AppScaffoldNew(
      appBartitleText: "Ongoing Video Call",
      appBarVerticalSize: Get.height * 0.12,
      
     
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(widget.meetingId),
                //render all participant
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 300,
                      ),
                      itemBuilder: (context, index) {
                        return ParticipantTile(
                            key: Key(participants.values.elementAt(index).id),
                            participant: participants.values.elementAt(index));
                      },
                      itemCount: participants.length,
                    ),
                  ),
                ),
                MeetingControls(
                  onToggleMicButtonPressed: () {
                    micEnabled ? _room.muteMic() : _room.unmuteMic();
                    micEnabled = !micEnabled;
                  },
                  onEndButtonPressed: () {
                    try {
                      _room.end();

                      Navigator.of(context).pop();
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  onToggleCameraButtonPressed: () {
                    camEnabled ? _room.disableCam() : _room.enableCam();
                    camEnabled = !camEnabled;
                  },
                  // onLeaveButtonPressed: () => _room.leave(),
                ),
                // IconButton(
                //     onPressed: () {
                //       _room.end();
                //     },
                //     icon: Icon(Icons.phone))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
