import 'package:campusbuzz_mainui/categories.dart';
import 'package:campusbuzz_mainui/model/event.dart';
import 'package:flutter/material.dart';//import 'package:campusbuzz_mainui/data/event_list.dart';


// Constants in Dart should be written in lowerCamelcase.
const AvailableCategories = [
  Categori(
    id: 'c1',
    Ctitle: 'Fests',
    color:Color(0xffE93030)

  ),

  Categori(
    id: 'c2',
    Ctitle: 'Sports',
    color:Color.fromARGB(255, 233, 48, 48)

  ),
  Categori(
    id: 'c3',
    Ctitle: 'Cultural',
    color:Color(0xffE93030)

  ),
  Categori(
    id: 'c4',
    Ctitle: 'Tech',
    color:Color(0xffE93030)

  ),
  Categori(
    id: 'c5',
    Ctitle: 'Talks',
    color:Color(0xffE93030)

  ),
];




  //event details
const Event_details = [
  Event(
    id: 'm1',
    type:["Near By Events","Popluar Events"],
    categories: "c1",
    date: 'Oct 18 2023',
    title: 'Aquila Fest 2023',
    imageUrl:
        'images/event.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),

  Event(
    id: 'm2',
    type: ["Popular Events"],
    categories: "c1",
    date: 'Oct 20 2023',
    title: 'Aquila Fest 2024',
    imageUrl:
        'images/music.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),

  Event(
    id: 'm2',
    type: ["Near By Events","Popular Events"],
    categories:"c2",
    date: 'Oct 20 2023',
    title: 'Aquila Fest 2024',
    imageUrl:
        'images/dance.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),

  Event(
    id: 'm2',
    type: ["Near By Events","Popular Events"],
    categories:"c2",
    date: 'Oct 20 2023',
    title: 'dance Fest 2024',
    imageUrl:
        'images/dance.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),

  Event(
    id: 'm2',
    type: ["Near By Events","Popular Events"],
    categories:"c2",
    date: 'Oct 20 2023',
    title: 'hiphop Fest 2024',
    imageUrl:
        'images/dance.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),
  

    
];