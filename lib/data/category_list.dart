import 'package:campusbuzz_mainui/categories.dart';
import 'package:flutter/material.dart';



class Categ extends StatelessWidget {
  const Categ({super.key,required this.categori,required this.onSelectCategory});

  final Categori categori;

  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        //insted of inkwell using GestureDetector
        onTap: onSelectCategory, //for navigations or any other function
        child: Container(
          width: 90,
          decoration: BoxDecoration(
              color: categori.color,
              borderRadius: BorderRadius.circular(22)),
          child:Center(
            child: Text(
              categori.Ctitle,
              style:const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
