import 'package:flutter/material.dart';
//import 'package:flutter_app/data/drawer_items.dart';
import 'package:flutter_app/data/profile.dart';
import 'package:flutter_app/model/profile.dart';
import 'package:flutter_app/profile_helpers.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int selectedDrawerIndex = 0;
  int selectedProfileIndex = 0;

  @override
  void initState() {
    super.initState();

    selectedDrawerIndex = 0;
    selectedProfileIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          buildAccountInfo(selectedProfileIndex, (newIndex) {
            setState(() {
              selectedProfileIndex = newIndex;
            });
          }),
        ],
      ),
    );
  }
}

Widget buildAccountInfo(int selectedProfileIndex, Function(int) onProfileSelected) {
  final List<Profile> otherProfiles = getNotSelectedProfiles(selectedIndex: selectedProfileIndex);
  final Profile selectedProfile = profiles[selectedProfileIndex];

  return UserAccountsDrawerHeader(
    accountName: Text(selectedProfile.name),
    accountEmail: Text(selectedProfile.email),
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/background.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    currentAccountPicture: Image.asset(selectedProfile.image),
    otherAccountsPictures: otherProfiles
        .map(
          (profile) => InkWell(
            child: Image.asset(profile.image),
            onTap: () {
              onProfileSelected(profiles.indexWhere((currentProfile) => currentProfile == profile));
            },
          ),
        )
        .toList(),
  );
}
