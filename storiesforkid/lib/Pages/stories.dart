import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:storiesforkid/constants.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
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
      child: Column(
        children: [
          headerWidget(),
          imageWidget(),
          storiesWidget(),
          storiesDetailWidget(),
        ],
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

  Widget imageWidget() {
    return Container(
      decoration: BoxDecoration(
          //border: Border.all(width: 2, color: Colors.deepPurple),
          ),
      child: Image.network(
        listMapData[selectedIndex]['imageUrl'],
        width: 300,
        height: 300,
      ),
    );
  }

  Widget storiesWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        listMapData[selectedIndex]['storyName'],
        style: const TextStyle(fontFamily: 'Kalam', fontSize: 20),
      ),
    );
  }

  Widget storiesDetailWidget() {
    return Expanded(
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Text(
            listMapData[selectedIndex]['storyDetail'],
            style: const TextStyle(fontFamily: 'Kalam'),
          ),
        ),
      )),
    );
  }

  getStoryData() async {
    QuerySnapshot querySnapshot = await querySnapshotStories();
    for (var element in querySnapshot.docs) {
      print(element.data());
      listMapData.add(element.data() as Map<String, dynamic>);
    }
  }

  Future<QuerySnapshot> querySnapshotStories() =>
      FirebaseFirestore.instance.collection('stories').get().then((value) {
        return value;
      });
}
