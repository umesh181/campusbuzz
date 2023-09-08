import 'package:campusbuzz_mainui/event_detail_screen.dart';
import 'package:campusbuzz_mainui/explore_page/explore_page.dart';
import 'package:campusbuzz_mainui/model/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  Explore(
      {super.key,
      this.title,
      required this.event,
      required this.onToggleFavorite});

  final String? title;
  final List<Event> event;
  final void Function(Event event) onToggleFavorite;

  void selectEvent(BuildContext context, Event event) {
    //Navigator.of(context).pop(); //not required
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => EventDetailScreen(
          event: event,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  final CollectionReference events =
      FirebaseFirestore.instance.collection('events');

      


  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh ... nothing here!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffE93030))),

          //const SizedBox(height: 16),
          // Text(
          //   'Try selecting a different category!',
          //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //         color: Theme.of(context).colorScheme.onBackground,
          //       ),
          // ),
        ],
      ),
    );

    if (event.isNotEmpty) {
      content = StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot) { 

          if(streamSnapshot.hasData){
            return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (ctx, index) {
              final DocumentSnapshot documentSnapshot =
              streamSnapshot.data!.docs[index];
              return Explore_list(
                  event: event[index],
                  onselectevent: (event) {
                    selectEvent(context, event);
                  },
                  onToggleFavorite: onToggleFavorite,
                );
            });
          }
          return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title: Center(
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Color(0xffE93030),
              ),
            ),
          ),
          backgroundColor: Color(0xfff5f5f5),
          elevation: 0,
        ),
        body: content);
         }

         
        // child: ListView.builder(
        //     itemCount: event.length,
        //     itemBuilder: (ctx, index) => Explore_list(
        //           event: event[index],
        //           onselectevent: (event) {
        //             selectEvent(context, event);
        //           },
        //           onToggleFavorite: onToggleFavorite,
        //         )),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title: Center(
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Color(0xffE93030),
              ),
            ),
          ),
          backgroundColor: Color(0xfff5f5f5),
          elevation: 0,
        ),
        body: content);
  }
}
