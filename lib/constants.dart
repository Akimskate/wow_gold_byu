import 'package:flutter/material.dart';

const primaryColor = Color(0xFF45D1FD);
const secondaryColor = Color.fromRGBO(25, 25, 41, 1);
const bgColor = Color(0xFF1E1E28);

const defaultPadding = 20.0;
const maxWidth = 1440.0;
const defaultMargin = 10.0;

final srversEU = [
  'Amnennar',
  'Ashbringer',
  'Bloodfang',
  'Dragon\'s Call',
  'Dragonfang',
  'Dreadmist',
  'Earthshaker',
  'Everlook',
  'Finkle',
  'Firemaw',
  'Flamelash',
  'Gandling',
  'Gehennas',
  'Golemagg',
  'Heartstriker',
  'Hydraxian Waterlords',
  'Judgement',
  'Lakeshire',
  'Lucifron',
  'Mandokir',
  'Mirage Raceway',
  'Mograine',
  'Nethergarde Keep',
  'Noggenfogger',
  'Patchwerk',
  'Pyrewood Village',
  'Razorfen',
  'Razorgore',
  'Shazzrah',
  'Skullflame',
  'Stonespine',
  'Sulfuron',
  'Ten Storms',
  'Trancescendece',
  'Venoxis',
  'Zandalar Tribe',
];

final serversUS = [
  'Earthshaker',
];

final auctionHouses = [
  'Trade',
  'Mail',
  'Auction house',
  'Guild bank',
];

List descriptionWidgets = [
  FirstWidget,
];

class FirstWidget extends StatelessWidget {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('hello world');
  }
}
