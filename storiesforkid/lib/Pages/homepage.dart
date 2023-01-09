import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:storiesforkid/Pages/stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: mainWidget(_w),
    );
  }

  Widget mainWidget(double _w) {
    return animationGridViewWidged(_w);

    // return InkWell(
    //   onTap: () {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => const Stories()));
    //   },
    //   child: Center(
    //     child: Container(
    //       alignment: Alignment.center,
    //       width: 200,
    //       height: 200,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(1000), color: Colors.amber),
    //       child: const Text(
    //         'BAS BANA',
    //         style: TextStyle(
    //             fontSize: 30,
    //             color: Colors.deepPurpleAccent,
    //             fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget animationGridViewWidged(_w) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 2,
            child: ScaleAnimation(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Stories(),
                        ));
                    print("$index");
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: _w / 30, left: _w / 60, right: _w / 60),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(child: Text("$index")),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
