


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddStory extends StatelessWidget {
  final VoidCallback  callback;
  const AddStory({super.key,required this.callback});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  callback() ,
      child:  Stack(
        children: [
          Image.asset('assets/circle.png',width: 58,height: 58,),
          Positioned(left: 19,
          top: 19,
            
            child: Image.asset('assets/plus.png',width: 20,height: 20,)
          )
          
        ],
      ),
    );
  }

}