import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Event {
  final String title;
  final String date;
  final String time;
  final String imageAsset;
  bool isFavorite;

  Event({
    required this.title,
    required this.date,
    required this.time,
    required this.imageAsset,
    this.isFavorite = false,
  });
}

class EventProvider extends ChangeNotifier {
 final List<Event> _events = [
    Event(
      title: 'Aquila Fest 2023',
      date: 'Oct 18 2023',
      time: '08:30 PM',
      imageAsset: 'images/event.jpg',
    ),
    Event(
      title: 'Cultural Fest',
      date: 'Oct 22 2023',
      time: '09:30 AM',
      imageAsset: 'images/music.jpg',
    ),
    // ... add more events
  ];

  List<Event> get events => _events;

  void toggleFavorite(int index) {
    _events[index].isFavorite = !_events[index].isFavorite;
    notifyListeners();
  }
}

