import 'package:datagram/Constanst.dart';
import 'package:datagram/Fragments/DriveScreen.dart';
import 'package:datagram/Fragments/SharedWithMeScreen.dart';
import 'package:datagram/Fragments/StatisticScreen.dart';
import 'package:datagram/Fragments/TrashScreen.dart';
import 'package:datagram/SizeConfig.dart';
import 'package:datagram/Widgets/NavigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:datagram/RouteScreens/DatagramSettings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final tabs = [
    Center(
      child: DriveScreen(),
    ),
    Center(
      child: SharedWithMeScreen(),
    ),
    Center(
      child: StatisticScreen(),
    ),
    Center(
      child: TrashScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: CustomColors.defaultYellow,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: CustomColors.black,
            size: 25,
          ),
          onPressed: () => {_scaffoldKey.currentState.openDrawer()},
        ),
        title: SvgPicture.asset(
          'assets/icons/datagramblack.svg',
          height: SizeConfig.blockSizeHorizontal * 8,
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
      drawer: NavigationDrawer(),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: CustomColors.lightGray,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/datagram_singular_black.svg',
              height: 30,
              color: CustomColors.defaultYellow,
            ),
            icon: SvgPicture.asset(
              'assets/icons/datagram_singular_black.svg',
              height: 30,
              color: Colors.grey,
            ),
            title: Text(
              "Drive'ım",
              style: TextStyle(color: CustomColors.defaultYellow),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/folder_shared.svg',
                height: 30, color: Colors.grey),
            activeIcon: SvgPicture.asset(
              'assets/icons/folder_shared.svg',
              height: 30,
              color: CustomColors.defaultYellow,
            ),
            title: Text(
              "Paylaşılanlar",
              style: TextStyle(color: CustomColors.defaultYellow),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/stats.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/stats.svg',
              height: 30,
              color: CustomColors.defaultYellow,
            ),
            title: Text("İstatistikler",
                style: TextStyle(color: CustomColors.defaultYellow)),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/trash.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/trash.svg',
              height: 30,
              color: CustomColors.defaultYellow,
            ),
            title: Text(
              "Çöp Kutusu",
              style: TextStyle(color: CustomColors.defaultYellow),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: CustomColors.defaultYellow,
        onPressed: () {
          _actionsModalBottomSheetMenu(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _actionsModalBottomSheetMenu(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
              height: SizeConfig.screenHeight * .20,
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text(
                          'Yeni',
                          textScaleFactor: 1.5,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.create_new_folder),
                                label: Text(
                                  "Klasör",
                                ),
                                textColor: Colors.white,
                                splashColor: Colors.red,
                                color: CustomColors.defaultYellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                            RaisedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.cloud),
                                label: Text(
                                  "Yükle",
                                ),
                                textColor: Colors.white,
                                splashColor: Colors.red,
                                color: CustomColors.defaultYellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)))
                          ]),
                    ]),
              ));
        });
  }
}
