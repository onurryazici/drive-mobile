import 'package:flutter/material.dart';
import 'package:datagram/DatagramComponents/DatagramItem.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DriveScreen extends StatefulWidget {
  @override
  _DriveScreenState createState() => _DriveScreenState();
}

class _DriveScreenState extends State<DriveScreen> {
  Future<List<DatagramItem>> _getData() async {
    var data = await http.get("http://10.0.2.2:3000/api");
    var jsonData = json.decode(data.body);

    List<DatagramItem> datagramItems = [];
    for (var i in jsonData) {
      DatagramItem item = DatagramItem(i["name"], i["surname"]);
      datagramItems.add(item);
    }

    return datagramItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text('Yükleniyor ...'),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.accessibility_new),
                  title: Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].surname),
                  onTap: () => {},
                );
              },
            );
          }
        },
      ),
    );
  }
}
