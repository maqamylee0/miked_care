import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../homepage/views/pages/homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        children: [
          HomePage(),
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(()=>_currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house,color: Colors.black,),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.rectangleList,color: Colors.black,),
              label: "Favorite"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.clock,color: Colors.black,),
              label: "Favorite"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.quoteRight,color: Colors.black,),
              label: "Favorite"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user,color: Colors.black,),
              label: "Favorite"

          )
        ],
      ),

    );
  }
}
