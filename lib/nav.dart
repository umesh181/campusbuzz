import 'package:campusbuzz_mainui/data/event_list.dart';

import 'package:campusbuzz_mainui/homescreen.dart';
import 'package:campusbuzz_mainui/model/event.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:campusbuzz_mainui/event_explore_screen/explore_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {

    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {

  final List<Event> _favoriteEvent = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatus(Event event) {
    final isExisting = _favoriteEvent.contains(event);

    if (isExisting) {
      setState(() {
        _favoriteEvent.remove(event);
        _showInfoMessage('Removed from favorites');
      });
    } else { 
      setState(() {
        _favoriteEvent.add(event);
        _showInfoMessage('Added to favorites');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
     Widget activePage =const Homescreen();

     if (_selectedPageIndex == 1) {
       activePage = Explore(
        title: 'Explore',
      event: Event_details,
      onToggleFavorite: _toggleMealFavoriteStatus,
      );
     }

    if (_selectedPageIndex == 2) {
      activePage = Explore(
        event: _favoriteEvent,
        title: 'Favorites',
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
    }
    if (_selectedPageIndex == 3) {
        activePage=const profile();
      }
    return Scaffold(
        body: activePage,
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
              indicatorColor: Color.fromARGB(255, 255, 255, 255)),
          child: NavigationBar(
            backgroundColor: Colors.white,
            height: 60,
            selectedIndex: _selectedPageIndex,
            onDestinationSelected: (selectedPageIndex) =>
                setState(() => _selectedPageIndex = selectedPageIndex),
            destinations: [
              const Padding(
                padding: EdgeInsets.only(top: 13),
                child: NavigationDestination(
                  icon: Icon(
                    Icons.home_rounded,
                    color: Color(0xffE93030),
                    size: 35,
                  ),
                  label: '',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: NavigationDestination(
                  icon: Icon(
                    MdiIcons.compassOutline,
                    color: Colors.grey.shade800,
                    size: 35,
                  ),
                  label: '',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 13),
                child: NavigationDestination(
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: Color.fromARGB(255, 66, 66, 66),
                    size: 35,
                  ),
                  label: '',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 13),
                child: NavigationDestination(
                    icon: Icon(
                      Icons.person_outline,
                      color: Color.fromARGB(255, 66, 66, 66),
                      size: 35,
                    ),
                    label: ''),
              ),
            ],
          ),
        ),
      );
  }
}


class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}