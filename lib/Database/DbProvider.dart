import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
import 'package:qr_code/models/ProductList.dart';
import 'package:qr_code/page/Error.dart';

import 'dart:io';
import 'dart:async';


class DbProvider{

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path,"ProductDb.db"); //create path to database

    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db,int version) async{
          await db.execute("""
          CREATE TABLE ProductTable(
          Product_Id TEXT PRIMARY KEY ,
          Product_Name TEXT,
          Product_Desc TEXT)"""
          );
        });

  }

  Future<int> addItem(ProductList item) async{

    final db = await init();

    return db.insert("ProductTable", item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }






Future<List<ProductList>> fetchProduct() async{



  final db = await init();
  final maps = await db.query("ProductTable");
  List<ProductList> a=[];
  //<List<ProductList>> error;
  if (maps.length == null) {
     Error();


  } else {


   await List.generate(maps.length, (i) {
    return ProductList(
      Product_Id: maps[i]['Product_Id'],
      Product_Name: maps[i]['Product_Name'],
      Product_Desc: maps[i]['Product_Desc'],

    );
  });
  }

}}