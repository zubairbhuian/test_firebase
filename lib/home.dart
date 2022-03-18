import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
            child: const Icon(
          Icons.mark_as_unread,
          color: Colors.white,
        )),
      ),
    );
  }
}
