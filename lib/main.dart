import 'package:campusbuzz_mainui/event_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:campusbuzz_mainui/nav.dart';
import 'package:provider/provider.dart';
void main() {
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



