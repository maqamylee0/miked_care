import 'package:flutter/cupertino.dart';
import 'package:miked_care/constants.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';


import '../../../Utils/constants.dart';
import '../../../providers/appointment_provider.dart';
import '../../../providers/user_provider.dart';


class CallInvitationPage extends StatefulWidget {
  const CallInvitationPage({Key? key, required this.username, required this.child }) : super(key: key);
 final String username;
 final Widget child;
  @override
  State<CallInvitationPage> createState() => _CallInvitationPageState();
}


class _CallInvitationPageState extends State<CallInvitationPage> {

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    return onUserLogin();
  }

  onUserLogin() {
    /// 2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    return ZegoUIKitPrebuiltCallInvitationService().init(
      appID: Statics.appId,
      appSign: Statics.appSign,
      userID: widget.username,
      userName: widget.username,
      plugins: [ZegoUIKitSignalingPlugin()],

    );
  }
}
