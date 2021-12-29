import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HighPage extends StatefulWidget {
  const HighPage({Key? key}) : super(key: key);

  @override
  _HighPageState createState() => _HighPageState();
}

class _HighPageState extends State<HighPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Em alta',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
