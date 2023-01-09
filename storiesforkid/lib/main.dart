import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:storiesforkid/Pages/homepage.dart';
import 'package:storiesforkid/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getStoryData();
  runApp(const MaterialApp(
    home: HomePage(),
  ));
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
