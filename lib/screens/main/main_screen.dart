// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wow_gold_buy_v3/constants.dart';
import 'package:wow_gold_buy_v3/responsive_design.dart';
import 'package:wow_gold_buy_v3/screens/main/components/buy_section_widget.dart';
import 'package:wow_gold_buy_v3/screens/main/components/description_widget.dart';
import 'package:wow_gold_buy_v3/screens/main/components/second_section.dart';
import 'package:wow_gold_buy_v3/screens/main/components/side_menu.dart';
import 'package:wow_gold_buy_v3/screens/main/components/top_bar_widget.dart';

// TODO: fix the scrolling
GlobalKey dataKey = GlobalKey();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _scrollController = ScrollController();

  bool _showBackToTopButton = false;

  void scrollStart() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 100) {
            _showBackToTopButton = true;
          } else {
            _showBackToTopButton = false;
          }
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 35,
                  ),
                ),
              )),
      drawer: SideMenu(),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () => scrollStart(),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            if (Responsive.isDesktop(context))
              TopBarWidget(), //Top bar ready for 50 percent

            SecondSection(), //Text to buy section
            Card(
              key: dataKey,
              child: BuySectionWidget(),
            ),
            DescriptionSection(), //Buy section
          ],
        ),
      ),
    );
  }
}
