import 'package:qr_code/Database/DbProvider.dart';



class ProductList {
  final String Product_Id;
  final String Product_Name;
  final String Product_Desc;

  ProductList({this.Product_Id, this.Product_Name, this.Product_Desc});



  factory ProductList.fromJson(dynamic json) {
    return ProductList(Product_Id: json['Product_Id'] as String,
        Product_Name: json['Product_Name'] as String,
        Product_Desc: json['Product_Desc'] as String);


  }



  Map<String,dynamic> toMap() {
    return <String, dynamic>{
      "Product_Id": Product_Id,
      "Product_Name": Product_Name,
      "Product_Desc": Product_Desc,


    };
  }}
