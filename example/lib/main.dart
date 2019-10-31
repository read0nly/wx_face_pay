import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wx_face_pay/wx_face_pay.dart';

void main() async {
  UsuallyResponse model = await WxFacePay.initWxpayface();
  if (model.code == WX_FACE_PAY_SUCCESS) {
    print("weixin sdk init success!");
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("rawData¬"),
              onPressed: () async {
                RawDataRepose model = await WxFacePay.getWxpayfaceRawdata();
                if (model.code == WX_FACE_PAY_SUCCESS) {
                  print("rawdata:${model.rawData}");
                }
              },
            ),
            FlatButton(
              child: Text("开始扫码"),
              onPressed: () async {
                CodeScannerResponse code = await WxFacePay.startCodeScanner();
                print(code.content);
              },
            ),
            FlatButton(
              child: Text("停止扫码"),
              onPressed: () async {
                await WxFacePay.stopCodeScanner();
              },
            ),
          ],
        ),
      ),
    );
  }
}
