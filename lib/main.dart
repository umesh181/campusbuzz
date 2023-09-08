import 'dart:developer';

import 'package:campusbuzz_mainui/event_detail_screen.dart';
import 'package:campusbuzz_mainui/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  QuerySnapshot snapshot=await FirebaseFirestore.instance.collection('events').get();
  log(snapshot.docs.toString());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (context) => EventLikeNotifier(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Campusbuzz',
        home: TabsScreen(),
    
      ),
    );
  }
}



