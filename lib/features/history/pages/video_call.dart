// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:miked_care/constants.dart';
// import 'package:provider/provider.dart';
//   // z
//   //
//   //
//   // import '../../../Utils/constants.dart';
//   // import '../../../providers/appointment_provider.dart';
//   // import '../../../providers/user_provider.dart';
//
//
// class CallInvitationPage extends StatefulWidget {
//   const CallInvitationPage({Key? key, required this.username, required this.child }) : super(key: key);
//  final String username;
//  final Widget child;
//   @override
//   State<CallInvitationPage> createState() => _CallInvitationPageState();
// }
//
//
// class _CallInvitationPageState extends State<CallInvitationPage> {
// // Instantiate the client
//   final AgoraClient client = AgoraClient(
//     agoraConnectionData: AgoraConnectionData(
//       appId: Statics.appId,
//       channelName: "test",
//
//     ),
//     enabledPermission: [Permission.camera, Permission.microphone]
//   );
//   @override
//   Widget build(BuildContext contex) {
//     // final userProvider = Provider.of<UserProvider>(context);
//     return Stack(children:
//     [
//       AgoraVideoViewer(client: client),
//       AgoraVideoButtons(client: client)
//
//     ]);
//   }
//     //onUserLogin()
//   }
//
//   // onUserLogin() {
//   //   /// 2.1. initialized ZegoUIKitPrebuiltCallInvitationService
//   //   /// when app's user is logged in or re-logged in
//   //   /// We recommend calling this method as soon as the user logs in to your app.
//   //   return ZegoUIKitPrebuiltCallInvitationService().init(
//   //     appID: Statics.appId,
//   //     appSign: Statics.appSign,
//   //     userID: widget.username,
//   //     userName: widget.username,
//   //     plugins: [ZegoUIKitSignalingPlugin()],
//   //
//   //   );
//   // }
// //}
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'join_screen.dart';
import 'room_screen.dart';



class VideoSDKQuickStart extends StatefulWidget {
  const VideoSDKQuickStart({Key? key}) : super(key: key);

  @override
  State<VideoSDKQuickStart> createState() => _VideoSDKQuickStartState();
}

class _VideoSDKQuickStartState extends State<VideoSDKQuickStart> {
  String roomId = "";
  bool isRoomActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [

              Text("${roomId}"),
              IconButton(onPressed: (){
                FlutterClipboard.copy(roomId).then(( value ) =>
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Copied To Clipboard'),
                    )));
              }, icon: Icon(Icons.copy))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isRoomActive
            ? RoomScreen(
          roomId: roomId,
          token: token,
          leaveRoom: () {
            setState(() => isRoomActive = false);
          },
        )
            : JoinScreen(
          onRoomIdChanged: (value) => roomId = value,
          onCreateRoomButtonPressed: () async {
            roomId = await createRoom();
            setState(() => isRoomActive = true);
          },
          onJoinRoomButtonPressed: () {
            setState(() => isRoomActive = true);
          },
        ),
      ),
    );
  }
}