import 'package:campusbuzz_mainui/data/event_list.dart';
import 'package:campusbuzz_mainui/event_detail_screen.dart';
import 'package:campusbuzz_mainui/explore_page/explore_page.dart';
import 'package:campusbuzz_mainui/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:campusbuzz_mainui/model/event.dart';
class Explore extends StatelessWidget {
    const Explore ({super.key,this.title,required this.event,required this.onToggleFavorite});

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

  @override
  Widget build(BuildContext context) {

    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Text(
              'Uh oh ... nothing here!',
              style:TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Color(0xffE93030))
            ),
          
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
      content = ListView.builder(
        itemCount: event.length,
        itemBuilder: (ctx, index) => Homescreen(event: event,onselectevent: (event){
          selectEvent(context, event);
        }, onToggleFavorite: onToggleFavorite,)
      );
    }

    if(title==null){
      return content;
    }
    return  content;
  }
}