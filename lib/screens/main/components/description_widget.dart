import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wow_goldbuy_v3/constants.dart';
import 'package:wow_goldbuy_v3/responcive_design.dart';

List<String> imagePaths = [
  'images/gryphon.jpg',
  'images/wow.jpg',
  'images/lich_king.jpeg',
];

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.isDesktop(context) ? 1000 : 2010,
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
                Rect.fromLTRB(
                  0,
                  0,
                  bounds.width,
                  bounds.height,
                ),
              );
            },
            blendMode: BlendMode.dstOut,
            child: const Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          Responsive.isDesktop(context)
              ? Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100, left: 100),
                            child: Column(
                              children: [
                                Text(
                                  'HOW IT WORKS?',
                                  style: Responsive.isDesktop(context)
                                      ? GoogleFonts.poppins(
                                          fontSize: 75,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                          letterSpacing: 1,
                                        )
                                      : GoogleFonts.poppins(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                          letterSpacing: 1,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 100, right: 100, left: 30),
                            child: Column(
                              children: [
                                Text(
                                  'All of our gold is farmed by real players, the delivery time is up to 1 hour. Gold is a key to accessing many types of content. You can buy necessary things such as food, potions, flasks, BoE gear, gems, and lots of other useful stuff. And of course, with gold, you can treat yourself with a new mount or even buy a playing time in WoW, also known as WoW Token. And if you are looking for wow gold for sale you are at the right place. Boostingcity is the best place where you can find tons of gold for sale on each realm for any faction',
                                  style: Responsive.isDesktop(context)
                                      ? GoogleFonts.raleway(
                                          fontSize: 25,
                                          color: Colors.white,
                                          letterSpacing: 1,
                                        )
                                      : GoogleFonts.raleway(
                                          fontSize: 20,
                                          color: Colors.white,
                                          letterSpacing: 1,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: defaultPadding,
                        mainAxisSpacing: defaultPadding,
                      ),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade700),
                          color: secondaryColor,
                        ),
                        margin: const EdgeInsets.all(defaultMargin + 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        children: [
                          Text(
                            'HOW IT WORKS?',
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text(
                            'All of our gold is farmed by real players, the delivery time is up to 1 hour. Gold is a key to accessing many types of content. You can buy necessary things such as food, potions, flasks, BoE gear, gems, and lots of other useful stuff. And of course, with gold, you can treat yourself with a new mount or even buy a playing time in WoW, also known as WoW Token. And if you are looking for wow gold for sale you are at the right place. Boostingcity is the best place where you can find tons of gold for sale on each realm for any faction',
                            style: GoogleFonts.raleway(
                              fontSize: 15,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 1.1,
                                  crossAxisSpacing: defaultPadding,
                                  mainAxisSpacing: defaultPadding),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(30),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey.shade700),
                                color: secondaryColor,
                              ),
                              height: MediaQuery.of(context).size.height,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
