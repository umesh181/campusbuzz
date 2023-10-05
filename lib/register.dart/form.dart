import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  @override
  State<Forms> createState() => FormsState();
}

class FormsState extends State<Forms> {
String _sports="";
String _email="";
String _Phoneno="";
String _leaderName="";
String _collegename="";
String _teamsize="";
final GlobalKey<FormsState>_formkey = GlobalKey<FormsState>();
Widget _buildsports(){
  return TextField();
}
Widget _buildemail(){
  return TextField();
}
Widget _buildNo(){
  return  TextField();
}
Widget _buildLeaderName(){
  return  TextField();
}
Widget _buildcollegeNme(){
  return  TextField();
}
Widget _buildteamsize(){
  return  TextField();
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const Text("Title of the Event"),),
      
    );
  }
}