// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wow_gold_buy_v3/constants.dart';
import 'package:wow_gold_buy_v3/responsive_design.dart';
import 'package:wow_gold_buy_v3/screens/main/main_screen.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: AspectRatio(
        aspectRatio: 3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage('images/morjik.png'),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
            Container(
              color: bgColor.withValues(alpha: 0.36),
            ),
            Padding(
              padding: Responsive.isDesktop(context)
                  ? const EdgeInsets.only(left: 160.0)
                  : const EdgeInsets.only(left: 50.0, top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'BUYING GOLD WAS\nNEVER SO EASY',
                    style: Responsive.isDesktop(context)
                        ? GoogleFonts.poppins(
                            fontSize: 75,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                          )
                        : GoogleFonts.poppins(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                  ),
                  Text(
                    'Buy gold here! Any amount,\nany realm Starting from 0.01\$',
                    style: Responsive.isDesktop(context) ? 
                    GoogleFonts.raleway(
                      fontSize: 45,
                      color: Colors.white,
                      letterSpacing: 1,
                    ) : GoogleFonts.raleway(
                      fontSize: 25,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  // Buy button

                  ElevatedButton(
                    onPressed: () {
                      Scrollable.ensureVisible(
                        dataKey.currentContext ?? context,
                        curve: Curves.ease,
                        duration: const Duration(seconds: 1),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 2,
                          vertical: defaultPadding),
                      backgroundColor: primaryColor,
                      textStyle: TextStyle(fontSize: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Buy gold',
                      style: TextStyle(color: bgColor),
                    ),
                  ),
                  SizedBox(height: 45),
                  Flex(
                    direction: Responsive.isDesktop(context) ? Axis.horizontal : Axis.vertical,
                    children: 
                      [Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade700),
                          color: Color.fromRGBO(232, 232, 232, 0.15),
                        ),
                        padding: EdgeInsets.all(defaultPadding),
                        margin: EdgeInsets.all(0),
                        height: 120,
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '24/7',
                              style: TextStyle(fontSize: 20),
                            ),
                            RichText(
                              text: TextSpan(
                                text:
                                    '24/7 managers and they will be glad to help you in any possible way/7',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 45),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade700),
                          color: Color.fromRGBO(232, 232, 232, 0.15),
                        ),
                        padding: EdgeInsets.all(defaultPadding),
                        margin: EdgeInsets.all(defaultPadding),
                        height: 120,
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '1 HOUR',
                              style: TextStyle(fontSize: 20),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'average order processing time',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
