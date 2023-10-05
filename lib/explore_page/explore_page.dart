import 'package:campusbuzz_mainui/data/event_list.dart';
import 'package:campusbuzz_mainui/model/event.dart';
import 'package:campusbuzz_mainui/provider/favprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Explore_list extends ConsumerWidget {
  const Explore_list(
      {super.key,
      required this.event,
      required this.onselectevent,
     });

  final Event event;

  final void Function(Event event) onselectevent;
  // final void Function(Event event) onToggleFavorite;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favoriteEvents = ref.watch(favoriteEventsProvider);

    final isFavorite = favoriteEvents.contains(event);
    // final eventLikeNotifier = Provider.of<EventLikeNotifier>(context);
    // final isLiked = eventLikeNotifier.isLiked(event.id);
    return SingleChildScrollView(
      child: Column(
        children: [
          if (event == Event_details.first) // Add this condition
            const Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(top: 15,bottom: 10),
                  //   child: Text(
                  //     'Explore',
                  //     style: TextStyle(
                  //       fontSize: 25,
                  //       fontWeight: FontWeight.w800,
                  //       color: Color(0xffE93030),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          //search
          // if (event == Event_details.first)
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: const Color.fromARGB(255, 255, 255, 255),
            //         borderRadius: BorderRadius.circular(23.5)),
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 20,
            //       ),
            //       child: TextFormField(
            //         decoration: const InputDecoration(
            //           border: InputBorder.none,
            //           focusedBorder: InputBorder.none,
            //           hintText: 'Search anything...',
            //           hintStyle: TextStyle(color: Color(0xffC7C7C7)),
            //           prefixIcon: Icon(
            //             Icons.search,
            //             color: Color(0xffc7c7c7),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          InkWell(
            onTap: () {
              onselectevent(event);
            },
            child: Column(
              children: [
                //event 1
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: GestureDetector(
                          //insted of inkwell using GestureDetector
                          // onTap: () {
                          //   print("event pressed");
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => Detail()));
                          // }, //for navigations or any other function
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 370,
                            height: 200,
                            child: Stack(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(15.0),
                                //   child: FadeInImage(
                                //     placeholder: MemoryImage(kTransparentImage),
                                //     image:AssetImage(event.imageUrl),
                                //     fit: BoxFit.cover,

                                //     width: double.infinity,
                                //   ),
                                // ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Hero(
                                    tag: "hero1",
                                    child: Image.asset(
                                      event.imageUrl,
                                      width: 370,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10),
                                        child: CircleAvatar(
                                  
                                          backgroundColor: Colors.white,
                                          child:Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: InkWell(
                                  onTap: () {
                                    // Add your onPressed function here
                                    print('Icon pressed');
                                    final wasAdded = ref
                                        .read(favoriteEventsProvider.notifier)
                                        .toggleEventFavoriteStatus(event);
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(wasAdded
                                            ? 'Event added as a favorite.'
                                            : 'Event removed.'),
                                      ),
                                    );
                                    // widget.onToggleFavorite(event);
                                  },
                                  child:  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined,color: Colors.red,)
                                        
                                  ),
                                ),
                              ),
                                          // child: Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(left: 2),
                                          //   child: LikeButton(
                                          //     isLiked: isLiked,
                                          //     onTap: (liked) async {
                                          //       onToggleFavorite(event);
                                          //       eventLikeNotifier
                                          //           .toggleLike(event.id);
                                          //       return !liked;
                                          //     },
                                          //   ),
                                          // ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          //event info

                          const SizedBox(
                            height: 8,
                          ),

                          SizedBox(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Text(
                                      event.title,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 7),
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          event.date,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Icon(
                                          Icons.watch_later_outlined,
                                          size: 20,
                                        ),
                                        Text(
                                          event.time,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
