import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // The button colors codes.
  final list = [
    0xFFe13638, // red
    0xFFf19400, // orange
    0xFFfbf045, // yellow
    0xFF5dbb56, // green
    0xFF2da188, // teal
    0xFF429bf0, // blue
    0xFF9021ad, // purple
  ];

  Widget getButton(int index) {
    final player = AssetsAudioPlayer();

    // The expanded widget makes sure that the buttons spread vertically.
    return Expanded(
      child: FlatButton(
        onPressed: () => player.open(Audio('note${index + 1}.wav')),
        child: Text(''),
        color: Color(list[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        // Make sure the content doesn't overflow on different screen sizes
        // with SafeArea.
        body: SafeArea(
          child: new Column(
            // This stretches the buttons horizontally.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(7, getButton),
          ),
        ),
      ),
    );
  }
}
