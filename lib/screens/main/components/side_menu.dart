import 'package:flutter/material.dart';
import 'package:wow_goldbuy_v3/constants.dart';
import 'package:wow_goldbuy_v3/screens/main/main_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'WOW gold shop',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              runSpacing: 16,
              children: [
                ListTile(
                  title: const Text('Home',style: TextStyle(fontSize: 18),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Buy gold',style: TextStyle(fontSize: 18),),
                  onTap: () {
                    Scrollable.ensureVisible(
                  dataKey.currentContext ?? context,
                  curve: Curves.ease,
                  duration: const Duration(seconds: 1),
                );
                  Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Feedback',style: TextStyle(fontSize: 18),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
