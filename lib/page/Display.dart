import 'dart:core';
import 'package:qr_code/main.dart';


import 'package:flutter/material.dart';
import 'package:qr_code/models/ProductList.dart';
import 'package:qr_code/Database/DbProvider.dart';
import 'package:qr_code/page/Error.dart';



DbProvider Display1= DbProvider();
 Future<List<ProductList>> Display2=Display1.fetchProduct() ;
final List DisplayList=Display2 as List<ProductList>;










class Display extends StatefulWidget {










  @override


  _DisplayState createState() => _DisplayState();
}


class _DisplayState extends State<Display> {











  Widget build(BuildContext context) {
    return  ListView.builder(



        itemCount: DisplayList.length,
        itemBuilder:(context, i) => new Column(
          children: [
            ListTile(
              leading:Text(DisplayList[i].Product_Id) ,

              title:Row (
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [



                Text(DisplayList[i].Product_Name),

                ],
              ),
    subtitle: Text(DisplayList[i].Product_Desc),





            ),
          ],


        )
    );

  }
}
