import 'package:datagram/RouteScreens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'Constanst.dart';
import 'Fragments/HomeScreen.dart';
/* 
ANDROID 


the image with density 1 needs to be placed in mipmap-mdpi,
the image with density 1.5 needs to be placed in mipmap-hdpi,
the image with density 2 needs to be placed in mipmap-xdpi,
the image with density 3 needs to be placed in mipmap-xxdpi,
the image with density 4 needs to be placed in mipmap-xxxdpi,

IOS 


the image with density 1 needs to override LaunchImage.png,
the image with density 2 needs to override LaunchImage@2x.png,
the image with density 3 needs to override LaunchImage@3x.png,
the image with density 4 needs to override LaunchImage@4x.png,




*/

void main() {
  runApp(DatagramApp());
}

class DatagramApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Datagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: CustomColors.defaultYellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'CenturyGothic'),
      home: Center(child: LoginScreen()),
    );
  }
}
