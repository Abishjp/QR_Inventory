import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code/button_widget.dart';
import 'dart:convert';
import 'package:qr_code/models/ProductList.dart';
import 'package:qr_code/Database/DbProvider.dart';

import '../main.dart';
var Productdb=DbProvider();
var Product = new ProductList();

class Scan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrCode = 'Unknown';

  @override
  Widget build(BuildContext context) => Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Scan Result',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Sucessfully Scanned',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 72),
              ButtonWidget(
                text: 'Start QR scan',
                onClicked: () => scanQRCode(),


              ),
            ],
          ),
        ),
      );

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );



      setState(()async {
        this.qrCode = qrCode;



       final Product= ProductList.fromJson(jsonDecode(qrCode));

        await Productdb.addItem(Product);
       print(Product);



              });



    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
