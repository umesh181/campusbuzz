import 'package:flutter/material.dart';


class All extends StatelessWidget {
  const All({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Event Name',style: TextStyle(color: Colors.black),),backgroundColor:const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Hero(
        tag: "hero1",
        child: Image.asset('images/event.jpg')),
    );
  }
}


class Event2 extends StatelessWidget {
  const Event2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('images/music.jpg'),
    );
  }
}