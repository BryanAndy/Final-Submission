import 'package:QRScanner/generate.dart';
import 'package:QRScanner/scan.dart';
import 'package:flutter/material.dart';

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("assets/images/qr.png"),
            SizedBox(
              height: 10.0,
            ),
            flatButtonTwo("Scan QR Code", Scan(), context),
            SizedBox(
              height: 10.0,
            ),
            flatButtonTwo("Scan QR Code", Generate(), context),
          ],
        ),
      ),
    );
  }
}

Widget flatButtonTwo(String text, Widget widget, BuildContext context) {
  return FlatButton(
    padding: EdgeInsets.all(15.0),
    child: Text(text),
    onPressed: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => widget));
    },
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.blue, width: 3.0)),
  );
}
