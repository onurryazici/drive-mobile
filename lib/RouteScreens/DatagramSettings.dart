import 'package:datagram/Constanst.dart';
import 'package:flutter/material.dart';

class DatagramSettings extends StatefulWidget {
  @override
  _DatagramSettingsState createState() => _DatagramSettingsState();
}

class _DatagramSettingsState extends State<DatagramSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.defaultYellow,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.black,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text("Ayarlar"),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: CustomColors.black,
                  size: 25,
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DatagramSettings()))
                },
              ))
        ],
      ),
    );
  }
}
