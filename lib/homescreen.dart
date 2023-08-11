import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

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
      backgroundColor:const Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  //top bar
                  
                  children: [
                  Image.asset('svg/realloaction.png',width: 30,),
                  const Text('New bowenaplly',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
                  Padding(
                    padding: const EdgeInsets.only(left: 125),
                    child: Image.asset('svg/bell_3.png',width: 25),
                  )
                  
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              //search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(23.5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
                    child: TextFormField(
                      decoration:const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder:InputBorder.none, 
                        hintText: 'Search anything...',hintStyle: TextStyle(color: Color(0xffC7C7C7)),
                        prefixIcon: Icon(Icons.search,color: Color(0xffc7c7c7),
                        ),
                      ),
                    ),
                  ),
                ),
                
              ),
              const SizedBox(height: 10,),

              //category
            

              SizedBox(height: 55,
              child: ListView(
                scrollDirection: Axis.horizontal,
                
                children: [
                  //1st catg
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(//insted of inkwell using GestureDetector
                    onTap: () {},//for navigations or any other function
                    child:Container(
                      width: 77,
                      decoration: BoxDecoration(color: const Color(0xffE93030),borderRadius: BorderRadius.circular(22)),
                      child:const Center(child: Text('All',
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),),),
                      ),
                
                  ),
                ),

                //2nd catg
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(//insted of inkwell using GestureDetector
                    onTap: () {},//for navigations or any other function
                    child:Container(
                      width: 77,
                      decoration: BoxDecoration(color: const Color(0xffE93030),borderRadius: BorderRadius.circular(22)),
                      child:const Center(child: Text('Sports',
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),),),
                      ),
                
                  ),
                ),
                //3rd catg
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(//insted of inkwell using GestureDetector
                    onTap: () {},//for navigations or any other function
                    child:Container(
                      width: 77,
                      decoration: BoxDecoration(color: const Color(0xffE93030),borderRadius: BorderRadius.circular(22)),
                      child:const Center(child: Text('Fest',
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),),),
                      ),
                
                  ),
                ),
                //4th catg
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(//insted of inkwell using GestureDetector
                    onTap: () {},//for navigations or any other function
                    child:Container(
                      width: 77,
                      decoration: BoxDecoration(color: const Color(0xffE93030),borderRadius: BorderRadius.circular(22)),
                      child:const Center(child: Text('Music',
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),),),
                      ),
                
                  ),
                ),
                //5th catg
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(//insted of inkwell using GestureDetector
                    onTap: () {},//for navigations or any other function
                    child:Container(
                      width: 77,
                      decoration: BoxDecoration(color: const Color(0xffE93030),borderRadius: BorderRadius.circular(22)),
                      child:const Center(child: Text('More',
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),),),
                      ),
                
                  ),
                ),
              ],),),
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
                    onTap: () => carouselController.animateToPage(entry.key),
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

            ],
          ),
        ),
      ),
    );
  }
}
