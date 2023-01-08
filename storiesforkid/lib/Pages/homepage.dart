import 'package:flutter/material.dart';
import 'package:storiesforkid/Pages/stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Stories()));
      },
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000), color: Colors.amber),
          child: const Text(
            'BAS BANA',
            style: TextStyle(
                fontSize: 30,
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
