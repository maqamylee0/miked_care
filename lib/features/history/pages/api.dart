import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../constants.dart';


Future<String> createRoom() async {
  final http.Response httpResponse = await http.post(
    Uri.parse("https://api.videosdk.live/v2/rooms"),
    headers: {'Authorization': Statics.token},
  );

  return json.decode(httpResponse.body)['roomId'];
}