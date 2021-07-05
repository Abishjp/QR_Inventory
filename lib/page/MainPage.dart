import 'package:flutter/material.dart';

import 'package:qr_code/page/Display.dart';


import 'package:qr_code/page/Scan.dart';
import 'package:qr_code/Database/DbProvider.dart';
import 'package:qr_code/models/ProductList.dart';





class MyApp extends StatelessWidget {
  static final String title = 'QR Code Scanner';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primaryColor: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.white,
    ),
    home: MainPage(title: title),
  );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentindex = 0;
  final List _children = [
    Scan(),
    Display(),

  ];

   void onTappedBar(int index) {
    setState(() {
      _currentindex = index;






    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.purple,
      title: Text('QR Scanner'),

    ),
    body: Center(
      child: _children[_currentindex],),


     bottomNavigationBar: BottomNavigationBar(
        iconSize: 50.0,
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        selectedIconTheme: IconThemeData(color: Colors.white),
        items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.qr_code, color: Colors.white),
            label: 'Scan',
          ),
           BottomNavigationBarItem(
              icon: Icon(Icons.inventory, color: Colors.white), label: 'Display'),

        ],
        currentIndex: _currentindex,
        onTap: onTappedBar,

            ),


      );


}
