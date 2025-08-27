import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wow_gold_buy_v3/constants.dart';
import 'package:wow_gold_buy_v3/screens/main/components/buy_form_widget.dart';

class BuySectionWidget extends StatelessWidget {
  const BuySectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 1350) {
      return Container(
        height: 1000,
        color: secondaryColor,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FirstContainer(),
                SizedBox(width: 10),
                SecondContainer(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ThirdContainer(),
                SizedBox(width: 10),
                FourthContainer(),
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        color: secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade700),
                color: bgColor,
              ),
              height: 750,
              width: 780,
              child: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: BuyFomWidget(),
              ),
            ),
            const SizedBox(height: 10),
            const SecondContainer(),
            const SizedBox(height: 10),
            const ThirdContainer(),
            const SizedBox(height: 10),
            const FourthContainer()
          ],
        ),
      );
    }
  }
}

class FourthContainer extends StatelessWidget {
  const FourthContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade700),
        color: bgColor,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      height: 300,
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: 'TRADE ADVICES:',
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: '\nBefore purchase of gold, we advise you to',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nsend a message for us and clarify all details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
            ),
            RichText(
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              text: TextSpan(
                  text: 'Do not contact us in the game! ',
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Blizzard \nattentively monitor chats',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(text: '\n '),
                  ]),
            ),
            RichText(
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              text: TextSpan(
                text: 'Choose convenient for you delivery method:',
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: '\n     \u2022 direct trade in the game',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: '\n     \u2022 auction buyout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\n     \u2022 ingame mail transfer or trade via guild bank',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
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

class ThirdContainer extends StatelessWidget {
  const ThirdContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade700),
        color: bgColor,
      ),
      height: 300,
      width: 800,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(
                    Rect.fromLTRB(0, 0, bounds.width, bounds.height));
              },
              blendMode: BlendMode.dstIn,
              child: const Image(
                image: AssetImage('images/dungeon.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    text: TextSpan(
                        text: 'TBC CLASSIC GOLD',
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text:
                                '\nWoW gold in Classic plays primary role if you want to survive. Make your life easier and buy everything you want for the gold of Boostingcity sales.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ]),
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

class SecondContainer extends StatelessWidget {
  const SecondContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade700),
        color: bgColor,
      ),
      height: 550,
      width: 500,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(
                    Rect.fromLTRB(0, 0, bounds.width, bounds.height));
              },
              blendMode: BlendMode.dstOut,
              child: const Image(
                image: AssetImage('images/goldie.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: RichText(
                text: TextSpan(
                    text: 'BUY \nGOLD',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: '\nIT\'S EASY!',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 75,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstContainer extends StatelessWidget {
  const FirstContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade700),
        color: bgColor,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      height: 550,
      width: 800,
      child: const Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: BuyFomWidget(),
      ),
    );
  }
}
