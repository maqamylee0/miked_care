import 'dart:convert';
import 'package:http/http.dart' as http;

String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI3MTIyZDJlMi0wZjYzLTQyY2UtYmIxYi05YzdhNzcyYTNiZGYiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY4NDkxODg0NSwiZXhwIjoxNzE2NDU0ODQ1fQ.DZ9um64Es1IPemnDL-hehasKBqQHv4uRhSPvPm0pe0M";

Future<String> createRoom() async {
  final http.Response httpResponse = await http.post(
    Uri.parse("https://api.videosdk.live/v2/rooms"),
    headers: {'Authorization': token},
  );

  return json.decode(httpResponse.body)['roomId'];
}