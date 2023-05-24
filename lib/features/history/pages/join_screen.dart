import 'package:flutter/material.dart';

class JoinScreen extends StatelessWidget {
  final void Function() onCreateRoomButtonPressed;
  final void Function() onJoinRoomButtonPressed;
  final void Function(String) onRoomIdChanged;

  const JoinScreen({
    Key? key,
    required this.onCreateRoomButtonPressed,
    required this.onJoinRoomButtonPressed,
    required this.onRoomIdChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            child: const Text("Create Room"),
            onPressed: onCreateRoomButtonPressed),
        const SizedBox(height: 16),
        TextField(
            decoration: const InputDecoration(
              hintText: "Room ID",
              border: OutlineInputBorder(),
            ),
            onChanged: onRoomIdChanged),
        const SizedBox(height: 8),
        ElevatedButton(
          child: const Text("Join"),
          onPressed: onJoinRoomButtonPressed,
        )
      ],
    );
  }
}