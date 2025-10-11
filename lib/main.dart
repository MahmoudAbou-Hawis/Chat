import 'dart:developer';

import 'package:chat/Presentation/screen/layoutScreen.dart';
import 'package:chat/Presentation/widgets/chatProfile.dart';
import 'package:chat/Presentation/widgets/searchWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(body:  CustomSearchBar(
        onSearchTap: (String text) => [Text("Result for: $text")],
        onTextUpdate: (text) {
           if(text.isEmpty) return [];
          List<Widget> elements = [];
          for(int i = 0 ; i< 5 ; i++)
          {
           String s ="";
            for(int j = 0 ; j < i+1 ; j++ )
            {
                s+= text;
            }
            elements.add(Text(s));
          }
          return elements;
        },
        onElementClick: (item, context) {
WidgetsBinding.instance.addPostFrameCallback((_) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Item clicked" )),
  );

});
        },
      ),
    ),
   // LayoutScreen()
    );
  }
}
