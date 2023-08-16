// import 'package:flutter/material.dart';



// class CategoryItem extends StatefulWidget {
//   final String categoryName;

//   const CategoryItem({super.key, required this.categoryName});

//   @override
//   _CategoryItemState createState() => _CategoryItemState();
// }

// class _CategoryItemState extends State<CategoryItem> {
//   bool _isTapped = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isTapped = !_isTapped;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8), // Add horizontal padding
//         child: Container(
//           width: 77,
//           decoration: BoxDecoration(
//             color: _isTapped ? Color(0xffE93030) : Color.fromARGB(255, 255, 255, 255),
//             borderRadius: BorderRadius.circular(22),
//           ),
//           child: Center(
//             child: Text(
//               widget.categoryName,
//               style: TextStyle(
//                 color: _isTapped ? Colors.white : Color(0xffE93030),
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// //trying 

  

