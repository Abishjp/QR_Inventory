import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code/models/ProductList.dart';
import 'package:qr_code/page/MainPage.dart';
import 'package:qr_code/page/Error.dart';


import 'package:qr_code/page/Scan.dart';
import 'package:qr_code/page/Display.dart';
import 'package:qr_code/Database/DbProvider.dart';
import 'package:qr_code/models/ProductList.dart';

DbProvider Db=new DbProvider();



void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR App',
      initialRoute: '/Navigate',
      routes:{
        '/Navigate':(context)=>MainPage(),

        '/ScanPage':(context)=>Scan(),
        '/Display':(context)=>Display(),
        '/Error':(context)=>Error(),

      },

    );
  }
}
