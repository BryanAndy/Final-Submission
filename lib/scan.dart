import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrResult = "Not yet scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrResult,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 20.0,
            ),

//scanning qr code

            FlatButton(
              padding: EdgeInsets.all(15.0),
              child: Text("Scan QR Code"),
              onPressed: () async {
                String scanning = await FlutterBarcodeScanner.scanBarcode(
                    "#FF6666", "Cancel", true, ScanMode.QR);

                setState(() {
                  qrResult = scanning;
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.blue, width: 3.0)),
            ),
          ],
        ),
      ),
    );
  }
}
