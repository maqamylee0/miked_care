import 'package:flutter/material.dart';
// import 'package:videosdk/rtc.dart';
import 'package:videosdk/videosdk.dart';
import 'room_controls.dart';
import 'participant_tile.dart';

class RoomScreen extends StatefulWidget {
  final String roomId;
  final String token;
  final void Function() leaveRoom;

  const RoomScreen(
      {Key? key,
        required this.roomId,
        required this.token,
        required this.leaveRoom})
      : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  Map<String, Stream?> participantVideoStreams = {};

  bool micEnabled = true;
  bool camEnabled = true;
  late Room room;

  void setParticipantStreamEvents(Participant participant) {
    participant.on(Events.streamEnabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() => participantVideoStreams[participant.id] = stream);
      }
    });

    participant.on(Events.streamDisabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() => participantVideoStreams.remove(participant.id));
      }
    });
  }

  void setRoomEventListener(Room _room) {
    setParticipantStreamEvents(_room.localParticipant);
    _room.on(
      Events.participantJoined,
          (Participant participant) => setParticipantStreamEvents(participant),
    );
    _room.on(Events.participantLeft, (String participantId) {
      if (participantVideoStreams.containsKey(participantId)) {
        setState(() => participantVideoStreams.remove(participantId));
      }
    });
    _room.on(Events.roomLeft, () {
      participantVideoStreams.clear();
      widget.leaveRoom();
    });
  }

  @override
  void initState() {
    super.initState();
    // Create instance of Roo

    room = VideoSDK.createRoom(
      roomId: widget.roomId,
      token: widget.token,
      displayName: "Emmilly Immaculate",
      micEnabled: micEnabled,
      camEnabled: camEnabled,
      maxResolution: 'hd',
      defaultCameraIndex: 1,
      notification: const NotificationInfo(
        title: "Video SDK",
        message: "Video SDK is sharing screen in the room",
        icon: "notification_share", // drawable icon name
      ),
    );

    setRoomEventListener(room);

    // Join room
    room.join();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Room ID: ${widget.roomId}"),
          RoomControls(
            onToggleMicButtonPressed: () {
              micEnabled ? room.muteMic() : room.unmuteMic();
              micEnabled = !micEnabled;
            },
            onToggleCameraButtonPressed: () {
              camEnabled
                  ? room.disableCam()
                  : room.enableCam();
              camEnabled = !camEnabled;
            },
            onLeaveButtonPressed: () => room.leave(),
          ),
          ...participantVideoStreams.values
              .map(
                (e) => ParticipantTile(
              stream: e!,
            ),
          )
              .toList(),
        ],
      ),
    );
  }
}
