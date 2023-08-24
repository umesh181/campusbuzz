import 'package:campusbuzz_mainui/model/event.dart';
import 'package:campusbuzz_mainui/paymet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:like_button/like_button.dart';


class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({
    super.key,
    required this.event,
    required this.onToggleFavorite,
  });

  final Event event;

  final void Function(Event event) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final eventLikeNotifier = Provider.of<EventLikeNotifier>(context);
    final isLiked = eventLikeNotifier.isLiked(event.id);
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
                              child: Padding(
                                padding: const EdgeInsets.only(left:2),
                                child: LikeButton(
                                  isLiked: isLiked,
                                  onTap: (liked) async {
                                    onToggleFavorite(event);
                                    eventLikeNotifier.toggleLike(event.id);
                                    return !liked;
                                  },
                                ),
                              ),
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
                            const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Icon(
                                Icons.arrow_forward_ios,
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

                      SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 40,
                            ),
                            SizedBox(
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
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 1.5,
                                      ),
                                      Text(
                                        event.college_name,
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
                            InkWell(
                              onTap: () {
                                print("location tapped");
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
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
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const Upi(),));
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
              SizedBox(
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
