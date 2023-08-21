import 'package:campusbuzz_mainui/model/event.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(event.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: InkWell(
                        onTap: () {
                          // Add your onPressed function here
                          //onToggleFavorite(event);;
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(Icons.favorite,
                              color: Color(0xffF81B1B), size: 22),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black45,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      event.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // Very long text ...
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    //const SizedBox(height: 12),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
