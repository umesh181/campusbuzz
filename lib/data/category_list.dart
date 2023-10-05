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
      child: InkWell(
        //insted of inkwell using GestureDetector
        onTap: onSelectCategory, //for navigations or any other function
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: categori.color,
                  // boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.7),
                  //       spreadRadius: -4,
                  //       blurRadius: 11,
                  //       offset: Offset(0, 9), // changes position of shadow
                  //     ),
                  //   ],
                ),
                width: 90,
                height: 70,
              
                child: Image.asset(categori.categimg,
                ),
              ),
            ),
            SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.only(left:15),
              child: Text(categori.Ctitle,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),),
            )
          ],
        ),
      ),
    );
  }
}
