


import 'dart:math';

import 'package:chat/Presentation/screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutScreen extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => _LayoutScreen();
  
}


class _LayoutScreen extends State<LayoutScreen>
{
  int index = 1; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Column(key: Key("coloumn"),
          children: [
        Expanded(
      child: index == 1 
          ?  HomeScreen() 
          : const Center(child: Text("data")),
    ),
          Divider(
            color: Color(0xffC5BCBC),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width -40,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     _buildIconButton(
                  key: Key("person"),
                  icon: Icons.person_outline_outlined,
                  index: 0,
                ),
                _buildIconButton(
                  key: Key("person2"),
                  icon: Icons.people_outline,
                  index: 1,
                ),
                _buildIconButton(
                  key: Key("camera"),
                  icon: Icons.camera_alt_outlined,
                  index: 2,
                ),
                _buildIconButton(
                  key: Key("Setting"),
                  icon: Icons.settings_outlined,
                  index: 3,
                ),
                    ],
                  ),
                ),
              ],
            ),
          )
          ]

        )
      
    );
  }

 Widget _buildIconButton({required Key key, required IconData icon, required int index}) {
  return InkWell(
    
       highlightColor: Colors.transparent, 
   splashColor: Colors.transparent,
    key: key,
    
    onTap: () {
      if(index != this.index)
      {
        setState(() { this.index = index;});
      }
    } ,
    child: Container(
      decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(width: 4,color: (this.index == index) ? Color(0xff007665) : Colors.transparent))),
      height: 40,
      width: 77,
      child: Icon(
        icon,
        color: (this.index == index) ? Color(0xff007665) : Color(0xffC5BCBC),size: 30,
      ),
    ),
  ); 
}
}

class ggg extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return Container(color: Colors.red,);
  }
  
}