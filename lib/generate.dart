import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = "https://github.com/neon97";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              QrImage(data: qrData),

              //create own qr code
              SizedBox(
                height: 10.0,
              ),

              Text("Get your data/ link to the QR Code"),
              TextField(
                controller: qrText,
                decoration: InputDecoration(hintText: "Enter the data/ link"),
              ),

              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                padding: EdgeInsets.all(15.0),
                child: Text("Generate QR Code"),
                onPressed: () {
                  if (qrText.text.isEmpty) {
                    setState(() {
                      qrData = "hhtps://flutter.dev";
                    });
                  } else {
                    setState(() {
                      qrData = qrText.text;
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.blue, width: 3.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final qrText = TextEditingController();
}
