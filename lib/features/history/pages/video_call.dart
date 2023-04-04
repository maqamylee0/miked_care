import 'package:flutter/cupertino.dart';
import 'package:miked_care/constants.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';


import '../../../Utils/constants.dart';
import '../../../providers/appointment_provider.dart';
import '../../../providers/user_provider.dart';


class VideoCall extends StatefulWidget {
  const VideoCall({Key? key, required this.therapistUid}) : super(key: key);
 final String? therapistUid;
  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return ZegoUIKitPrebuiltCall(
      appID: Statics.appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: Statics.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: 'user_id',
      userName: 'user_name',
      callID: '1',
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        // ..onOnlySelfInRoom = () => Navigator.of(context).pop(),
    );;
    //   ZegoUIKitPrebuiltCallWithInvitation(
    //   appID: Statics.appId, /*input your AppID*/
    //   appSign: Statics.appSign, /*input your AppSign*/
    //   userID: userProvider.user.uid!,
    //   userName: userProvider.user.name!,
    //   plugins: [ZegoUIKitSignalingPlugin()],
    // child: Container(
    // child: Text('hii'),
    // ),
    // );
  }
}
