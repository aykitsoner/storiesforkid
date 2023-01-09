import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:storiesforkid/Pages/stories.dart';
import 'package:storiesforkid/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: mainWidget(_w),
    );
  }

  Widget mainWidget(double _w) {
    return animationGridViewWidged(_w);
  }

  Widget animationGridViewWidged(double _w) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: listMapData.length,
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
                    selectedIndex = index;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Stories(),
                        ));
                    print("$index");
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: _w / 30,
                        left: _w / 60,
                        right: _w / 60,
                        top: 20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.deepPurple),
                      color: Colors.deepPurple.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        listMapData[index]['imageUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  adData() async {
    final city = <String, String>{
      "name": "Los dsadsdsadsa",
      "state": "CA",
      "country": "USA"
    };
    FirebaseFirestore.instance.collection("cities").doc().set(city);
  }

  getData() async {
    QuerySnapshot querySnapshot = await querySnapshotFunc();
    for (var element in querySnapshot.docs) {
      print(element.data());
      // mapData = element.data() as Map<String, dynamic>;
      // listMapData.add(element.data() as Map<String, dynamic>);
    }
  }

  Future<QuerySnapshot> querySnapshotFunc() =>
      FirebaseFirestore.instance.collection('cities').get().then((value) {
        return value;
      });
}
