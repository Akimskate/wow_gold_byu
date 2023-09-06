// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wow_goldbuy_v3/constants.dart';
import 'package:wow_goldbuy_v3/screens/main/main_screen.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 220,
            height: 80,
            child: Container(
              alignment: Alignment.center,
              child: TextButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                  overlayColor: MaterialStateProperty.all(
                      Color.fromRGBO(145, 210, 255, 0.2)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                ),
                onPressed: () {},
                icon: SizedBox(
                    width: 55,
                    height: 55,
                    child: Image.asset('images/icon.png')),
                label: Text(
                  'Wow shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                overlayColor: MaterialStateProperty.all(
                    Color.fromRGBO(145, 210, 255, 0.2)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
              ),
              onPressed: () {},
              child: Text(
                'Home',
                style: GoogleFonts.nunito(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                overlayColor: MaterialStateProperty.all(
                    Color.fromRGBO(145, 210, 255, 0.2)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
              ),
              onPressed: () {
                Scrollable.ensureVisible(
                  dataKey.currentContext ?? context,
                  curve: Curves.ease,
                  duration: const Duration(seconds: 1),
                );
              },
              child: Text(
                'Buy gold',
                style: GoogleFonts.nunito(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                overlayColor: MaterialStateProperty.all(
                    Color.fromRGBO(145, 210, 255, 0.2)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
              ),
              onPressed: () {},
              child: Text(
                'Feedback',
                style: GoogleFonts.nunito(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          // TextButton.icon(
          //       style: ButtonStyle(
          //       padding: MaterialStateProperty.all(EdgeInsets.all(12)),
          //       overlayColor: MaterialStateProperty.all(Color.fromRGBO(145,210,255, 0.2)),
          //       shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
          //     ),
          //       onPressed: () {},
          //       icon: Icon(
          //   Icons.menu,
          //   size: 35,
          //   color: Colors.white,
          // ),
          //       label: Text(''),
          //       ),
        ],
      ),
    );
  }
}
