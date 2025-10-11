


import 'package:flutter/material.dart';



class CustomSearchBar extends StatelessWidget
{

  final List<Widget> Function(String text) onSearchTap;
  final List<Widget> Function(String text) ?onTextUpdate;
  final String? hintString;
  final Function(Widget item ,BuildContext context) onElementClick;

  CustomSearchBar({required this.onSearchTap, this.onTextUpdate ,this.hintString ,required this.onElementClick});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> searchPage(onSearchTap: this.onSearchTap ,onTextUpdate: this.onTextUpdate ,onElementClick:this.onElementClick,) )),
      child: ConstrainedBox(
        constraints:BoxConstraints(maxWidth: 356),
        child: Container(
            width: MediaQuery.of(context).size.width - 32,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
            border: Border.all(color: Color(0xffC5BCBC))
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 19),
            child: Row(
              children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset('assets/search.png',width:22,height: 22, ),
                                              const SizedBox(width: 8),

                    Text(hintString?? 'Search here...', style: TextStyle(color: Color.fromARGB(255, 207, 198, 198)),),
                
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:12.0),
                child: Icon(Icons.mic ,color: Color(0xffC5BDBD) ,),
              )
              ]
            ),
          ),
        ),
      ),
    );

  }
}

class searchPage extends StatefulWidget
{
    final List<Widget> Function(String text) onSearchTap;
  final List<Widget> Function(String text) ?onTextUpdate;
  final String? hintString;
    final Function(Widget item ,BuildContext context) onElementClick;



  searchPage({required this.onSearchTap,this.onTextUpdate,this.hintString,required this.onElementClick });
  @override
  State<StatefulWidget> createState() => _SearchWidget();

}

class _SearchWidget extends State<searchPage>
{
  late List<Widget> elements = [];
 late final TextEditingController _controller;


  @override
  void initState() {
     _controller = TextEditingController();

     _controller.addListener((){
      if(widget.onTextUpdate != null)
      {
        setState(() {
          elements = widget.onTextUpdate!(_controller.text);
        });
      }
     });
    super.initState();
  }
 
 @override
  void dispose() {
     _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap:()=> Navigator.pop(context),
                  child: Icon(Icons.arrow_back,color: Color(0xff55A99D)),
                ),
                const SizedBox(width: 12,),
                ConstrainedBox(
                  constraints:BoxConstraints(maxWidth: 356),
                  child: Container(
                      width: MediaQuery.of(context).size.width - 90,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                      border: Border.all(color: Color(0xffC5BCBC))
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 19),
                      child: Row(
                        children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset('assets/search.png',width:22,height: 22, ),
                              const SizedBox(width: 8),
                              Expanded(child: Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: TextField(
                                  controller: _controller,
                            
                                   decoration: InputDecoration(
                                              hintText: 'Search here...',
                                              border: InputBorder.none
                                            )            ),
                              ))
                          
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:12.0),
                          child: Icon(Icons.mic ,color: Color(0xffC5BDBD) ,),
                        )
                        ]
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                GestureDetector( onTap: ()=> setState(() {
                  elements = widget.onSearchTap(_controller.text);
                }) , child: Icon(Icons.arrow_forward_sharp ,color:  Color(0xff55A99D),))
              ],
            ),
            Expanded(
              child: ListView.builder(itemCount: elements.length,itemBuilder: (context,idx) {
              
                return InkWell(
                  onTap: ()=> widget.onElementClick(elements[idx],context),
                  child: elements[idx],
                );
              
              }),
            )
          ],
        ),
      ),
    ) ;
  }
  
}