import 'package:campusbuzz_mainui/calander.dart';
import 'package:campusbuzz_mainui/model/event.dart';
import 'package:campusbuzz_mainui/provider/favprovider.dart';
import 'package:campusbuzz_mainui/register.dart/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

_launchurl(Event event) async {
  var url = Uri.parse(
      event.location);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Cannot launch URL';
  }
}

class EventDetailScreen extends ConsumerWidget {
  const EventDetailScreen({
    super.key,
    required this.event,
  });

  final Event event;

  // final void Function(Event event) onToggleFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteEvents = ref.watch(favoriteEventsProvider);

    final isFavorite = favoriteEvents.contains(event);
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 259,
                //image
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        child: Hero(
                            tag: "hero1",
                            child: Image.asset(
                              event.imageUrl,
                              width: double.infinity,
                              height: 240,
                              fit: BoxFit.cover,
                            ))),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, left: 20),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5),
                                  child: Icon(Icons.arrow_back_ios),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 155,
                            right: 15,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Container(
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
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined,color: Colors.red,)
                                  ),
                                ),
                              ),
                              // child: Padding(
                              //   padding: const EdgeInsets.only(left:2),
                              //   child: LikeButton(
                              //     isLiked: isLiked,
                              //     onTap: (liked) async {
                              //       onToggleFavorite(event);
                              //       eventLikeNotifier.toggleLike(event.id);
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

              //title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  event.title,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),

              //about title
              SizedBox(
                height: 15,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  event.about_event_title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),

              //about section content

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                child: ReadMoreText(
                  event.about_event_content,
                  trimLines: 10,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Show More",
                  trimExpandedText: "Show Less",
                  lessStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF81B1B),
                  ),
                  moreStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF81B1B),
                  ),
                  style:
                      const TextStyle(fontWeight: FontWeight.w300, height: 1.5),
                ),
              ),

              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              //   child: Text('here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.',
              //   style: TextStyle(fontWeight:FontWeight.w300 ),),
              // )
              SizedBox(
                height: 15,
              ),

              //date and time

              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 235,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event.date,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 1.5,
                                        ),
                                        Text(
                                          event.time,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8D8D8D)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CalendarPage()));
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 7,
                      ),

                      //location

                      GestureDetector(
                        onTap: () {
                          _launchurl(event);
                        },
                        child: Container(
                          child: SizedBox(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 40,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 235,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            event.college_name,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 1.5,
                                          ),
                                          Text(
                                            event.college_name,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff8D8D8D)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                InkWell(
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),

              //buy button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MaterialButton(
                  color: Color(0xff112031),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Forms()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Register Now",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class for liked button color status

class EventLikeNotifier extends ChangeNotifier {
  final Set<String> _likedEventIds = {};

  void toggleLike(String eventId) {
    if (_likedEventIds.contains(eventId)) {
      _likedEventIds.remove(eventId);
    } else {
      _likedEventIds.add(eventId);
    }
    notifyListeners();
  }

  bool isLiked(String eventId) {
    return _likedEventIds.contains(eventId);
  }
}




// class Form extends StatelessWidget {
//   const Form({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Colors.blue,
//       body: Text("data"),
//     );
//   }
// }