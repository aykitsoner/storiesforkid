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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: mainWidget(size),
    );
  }

  Widget mainWidget(Size size) {
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
          imageWidget(size),
          //storiesWidget(),
          SizedBox(
            height: 15,
          ),
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
                  size: 25,
                ),
              ),
            ),
            Text(
              listMapData[selectedIndex]['storyName'],
              style: TextStyle(
                  fontFamily: 'Kalam',
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 61, 18, 69)),
            ),
            SizedBox(
              width: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWidget(size) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      )
          //border: Border.all(width: 2, color: Colors.deepPurple),
          ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Image.network(
          listMapData[selectedIndex]['imageUrl'],
          fit: BoxFit.contain,
          width: size.width,
          height: 300,
        ),
      ),
    );
  }

  Widget storiesWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        listMapData[selectedIndex]['storyName'],
        style: const TextStyle(
          fontFamily: 'Kalam',
          fontSize: 25,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget storiesDetailWidget() {
    return Expanded(
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Container(
          //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Text(
            listMapData[selectedIndex]['storyDetail'],
            style: const TextStyle(fontFamily: 'Kalam', fontSize: 18),
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
