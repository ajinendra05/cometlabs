import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppBar mainAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            "News",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
          Text(
            "Hub",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          )
        ],
      ),
      backgroundColor: Colors.amber,
      elevation: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('title')),
      body: Column(children: []),
    );
    ;
  }
}
