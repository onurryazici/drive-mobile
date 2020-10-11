import 'package:datagram/Constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset('assets/logo.png'),
            decoration: BoxDecoration(color: CustomColors.black),
          ),
          ListTile(
            title: Text('Drive\'ım'),
            leading: SvgPicture.asset(
              'assets/icons/datagram_singular_black.svg',
              height: 25,
              color: CustomColors.defaultGray,
            ),
            onTap: () {
              //homeScreen = HomeScreen(this.callback)
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/folder_shared.svg',
              height: 25,
              color: CustomColors.defaultGray,
            ),
            title: Text('Benimle Paylaşılanlar'),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/stats.svg',
              height: 25,
              color: CustomColors.defaultGray,
            ),
            title: Text('İstatistikler'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Çöp Kutusu'),
            leading: SvgPicture.asset(
              'assets/icons/trash.svg',
              height: 25,
              color: CustomColors.defaultGray,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
