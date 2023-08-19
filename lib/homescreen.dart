import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:campusbuzz_mainui/detail_page.dart';



// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}
bool showAllItems = false;

class _HomescreenState extends State<Homescreen> {
  List imageList = [
    {"id": 1, "image_path": 'images/event1.jpg'},
    {"id": 2, "image_path": 'images/event3.png'},
    {"id": 3, "image_path": 'images/event5.webp'}
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                child: Row(
                  //top bar

                  children: [
                    Image.asset(
                      'svg/realloaction.png',
                      width: 30,
                    ),
                    const Text('New bowenaplly',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)),
                    GestureDetector(
                      onTap: (){
                        print("bell icon tapped");
                      },
                      child: const Padding(
                        padding:EdgeInsets.only(left: 130),
                        child: Icon(Icons.notifications_none,size:30,)//Image.asset('svg/bell_3.png', width: 25),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(23.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Search anything...',
                        hintStyle: TextStyle(color: Color(0xffC7C7C7)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffc7c7c7),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //category
              

              SizedBox(
                height: 55,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //1st catg
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        //insted of inkwell using GestureDetector
                        onTap: () {
                          

                          print("all catg");
                        }, //for navigations or any other function
                        child: Container(
                          width: 77,
                          decoration: BoxDecoration(
                              color: const Color(0xffE93030),
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                            child: Text(
                              'All',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //2nd catg
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        //insted of inkwell using GestureDetector
                        onTap: () {}, //for navigations or any other function
                        child: Container(
                          width: 77,
                          decoration: BoxDecoration(
                              color: const Color(0xffE93030),
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                            child: Text(
                              'Sports',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //3rd catg
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        //insted of inkwell using GestureDetector
                        onTap: () {}, //for navigations or any other function
                        child: Container(
                          width: 77,
                          decoration: BoxDecoration(
                              color: const Color(0xffE93030),
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                            child: Text(
                              'Fest',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //4th catg
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        //insted of inkwell using GestureDetector
                        onTap: () {}, //for navigations or any other function
                        child: Container(
                          width: 77,
                          decoration: BoxDecoration(
                              color: const Color(0xffE93030),
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                            child: Text(
                              'Music',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //5th catg
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        //insted of inkwell using GestureDetector
                        onTap: () {}, //for navigations or any other function
                        child: Container(
                          width: 77,
                          decoration: BoxDecoration(
                              color: const Color(0xffE93030),
                              borderRadius: BorderRadius.circular(22)),
                          child: const Center(
                            child: Text(
                              'More',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              const SizedBox(height: 5),

              //running banner

              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17 : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Color.fromARGB(255, 189, 29, 29)
                                    : const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

              //nearby events title
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 200),
                child: Text(
                  'Near By Events',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff112031)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //nearby events list
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //1st event
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: GestureDetector(
                              //insted of inkwell using GestureDetector
                              onTap: () {
                                print("event pressed");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail()));
                              }, //for navigations or any other function
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 210,
                                    height: 138,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Hero(
                                            tag: "hero1",
                                            child: Image.asset(
                                              'images/event.jpg',
                                              width: 210,
                                              height: 138,
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
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Add your onPressed function here
                                                      print('Icon pressed');
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xffF81B1B),
                                                          size: 22),
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
                                  //event info

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  const SizedBox(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 50, left: 5),
                                          child: Text(
                                            'Aquila Fest 2023',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 6, left: 3),
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Oct 18 2023",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(
                                                  width: 28,
                                                ),
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "08:30 PM",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
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

                    //2nd event

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: GestureDetector(
                              //insted of inkwell using GestureDetector
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Event2()));
                                print("event pressed");
                              }, //for navigations or any other function
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 210,
                                    height: 138,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.asset(
                                            'images/music.jpg',
                                            width: 210,
                                            height: 138,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, right: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Add your onPressed function here
                                                      print('Icon pressed');
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xffF81B1B),
                                                          size: 22),
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
                                  //event info

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  const SizedBox(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 50, left: 5),
                                          child: Text(
                                            'Cultural Fest',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 6, left: 3),
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Oct 22 2023",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(
                                                  width: 28,
                                                ),
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "09:30 AM",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
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

                    //event 3

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: GestureDetector(
                              //insted of inkwell using GestureDetector
                              onTap: () {
                                print("event pressed");
                              }, //for navigations or any other function
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 210,
                                    height: 138,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.asset(
                                            'images/dance.jpg',
                                            width: 210,
                                            height: 138,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, right: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Add your onPressed function here
                                                      print('Icon pressed');
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xffF81B1B),
                                                          size: 22),
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
                                  //event info

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  const SizedBox(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 50, left: 5),
                                          child: Text(
                                            'Dance Competition',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 6, left: 3),
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Nov 18 2023",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(
                                                  width: 28,
                                                ),
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "01:30 PM",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
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

                    //event 4
                  ],
                ),
              ),

              //popular events title

              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  right: 200,
                ),
                child: Text(
                  'Popular Events',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff112031)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //popluar events

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //1st popular event
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: GestureDetector(
                              //insted of inkwell using GestureDetector
                              onTap: () {
                                print("event pressed");
                              }, //for navigations or any other function
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 210,
                                    height: 138,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.asset(
                                            'images/event.jpg',
                                            width: 210,
                                            height: 138,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, right: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Add your onPressed function here
                                                      print('Icon pressed');
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xffF81B1B),
                                                          size: 22),
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
                                  //event info

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  const SizedBox(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 50, left: 5),
                                          child: Text(
                                            'Aquila Fest 2023',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 6, left: 3),
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Oct 18 2023",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(
                                                  width: 28,
                                                ),
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "08:30 PM",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
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

                    //2nd popular event

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: GestureDetector(
                              //insted of inkwell using GestureDetector
                              onTap: () {
                                print("event pressed");
                              }, //for navigations or any other function
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 210,
                                    height: 138,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.asset(
                                            'images/music.jpg',
                                            width: 210,
                                            height: 138,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, right: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Add your onPressed function here
                                                      print('Icon pressed');
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xffF81B1B),
                                                          size: 22),
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
                                  //event info

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  const SizedBox(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 50, left: 5),
                                          child: Text(
                                            'Cultural Fest',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 6, left: 3),
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Oct 22 2023",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(
                                                  width: 28,
                                                ),
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "09:30 AM",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
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

                    //3rd popular event

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: GestureDetector(
                              //insted of inkwell using GestureDetector
                              onTap: () {
                                print("event pressed");
                              }, //for navigations or any other function
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 210,
                                    height: 138,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.asset(
                                            'images/dance.jpg',
                                            width: 210,
                                            height: 138,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, right: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      print('Icon pressed');
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xffF81B1B),
                                                          size: 22),
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
                                  //event info

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  const SizedBox(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 50, left: 5),
                                          child: Text(
                                            'Dance Competition',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 6, left: 3),
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Nov 18 2023",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(
                                                  width: 28,
                                                ),
                                                Icon(
                                                  Icons.watch_later_outlined,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "01:30 PM",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300),
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
        ),
      ),
    );
  }
}
/**
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * / */