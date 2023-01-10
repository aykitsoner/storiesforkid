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
    return Expanded(
      child: AnimationLimiter(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.withOpacity(0.8),
                Colors.purple.withOpacity(0.8),
                Colors.blue.withOpacity(0.8),
                Colors.green.withOpacity(0.8),
                Colors.yellow.withOpacity(0.8),
                Colors.orange.withOpacity(0.8),
                Colors.red.withOpacity(0.8),
              ],
            ),
          ),
          child: GridView.builder(
            itemCount: listMapData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
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
                            bottom: _w / 90,
                            left: _w / 60,
                            right: _w / 60,
                            top: 20),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Colors.deepPurple),
                          color: Colors.deepPurple.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: const [
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
        ),
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
  Widget backroundWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.withOpacity(0.8),
            Colors.purple.withOpacity(0.8),
            Colors.blue.withOpacity(0.8),
            Colors.green.withOpacity(0.8),
            Colors.yellow.withOpacity(0.8),
            Colors.orange.withOpacity(0.8),
            Colors.red.withOpacity(0.8),
          ],
        ),
      ),
    );
  }

  Widget headerWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.09,
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 61, 18, 69),
                  size: 30,
                ),
              ),
            ),
            const Text(
              "Hikaye",
              style: TextStyle(
                  color: Color.fromARGB(255, 61, 18, 69), fontSize: 30),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.settings,
                color: Color.fromARGB(255, 61, 18, 69),
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
