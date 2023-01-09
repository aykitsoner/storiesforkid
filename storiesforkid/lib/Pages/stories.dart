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
    return Column(
      children: [
        headerWidget(),
        imageWidget(),
        storiesWidget(),
        storiesDetailWidget(),
      ],
    );
  }

  Widget headerWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.09,
      decoration: const BoxDecoration(color: Colors.amber),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.deepPurpleAccent,
                size: 30,
              ),
            ),
            const Text(
              "Uygulama",
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 30),
            ),
            const Icon(
              Icons.settings,
              color: Colors.deepPurpleAccent,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Image.network(
      listMapData[selectedIndex]['imageUrl'],
      width: 300,
      height: 300,
    );
  }

  Widget storiesWidget() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        listMapData[selectedIndex]['storyName'],
      ),
    );
  }

  Widget storiesDetailWidget() {
    return Text(listMapData[selectedIndex]['storyDetail']);
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
