



import 'package:chat/Presentation/widgets/addStory.dart';
import 'package:chat/Presentation/widgets/chatProfile.dart';
import 'package:chat/Presentation/widgets/searchWidget.dart';
import 'package:chat/Presentation/widgets/userPhoto.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return  SafeArea(
        top: true,
        bottom: false,
        child: Column(
            children: [
                Row(
                  children: [
                    const SizedBox(width: 23,),
                     Text("Chat", style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold
                  ),),
                  ]),
                  const SizedBox(height: 19,),
                  CustomSearchBar(onSearchTap: (String s) => [], onElementClick: (s,t){}),
                  const SizedBox(height: 29,),
                  Padding(
                    padding: EdgeInsets.only(left: 18,right: 14),
                    child: SizedBox(
                      height: 58,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (cnt,idx){
                        if(idx == 0) {return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: AddStory(callback: (){}),
                        );}
                        else {return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: UserPhoto(PhotoCallback: () {},isStatusWatched: false,hasStatus: true,imageLink: '',),
                        );}
                  
                      
                      },),
                    
                    ),
                  )
                  ,
                  const SizedBox(height: 24,),
              Expanded(child: 
              ListView.builder(itemBuilder: (cnt,idx){
                return Padding(
                    padding: EdgeInsets.only(left: 18,right: 14,bottom: 12),
                  child: ChatProfile(hasStatus: idx%2 == 0, imageLink: '', name: 'Mahmoud AbouHawis', unreadCount: idx, date: '15 Mar', lastMessage: 'Hello... ', isStatusWatched: idx %2 ==1, ChatCallback: (){}, PhotoCallback: (){}),
                );
              })
              )
            ],
          ),
      );
  }
  
}