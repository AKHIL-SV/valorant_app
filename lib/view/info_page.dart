import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:valorant_app/view/utls/ability_tile.dart';
import 'package:valorant_app/view/utls/constants.dart';

class InfoPage extends StatelessWidget {
  final List? valo;
  final int index;
  final String portrait;
  const InfoPage(
      {super.key,
      required this.valo,
      required this.index,
      required this.portrait});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xff111923),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white70),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2),
                          BlendMode.dstATop,
                        ),
                        image: NetworkImage(valo?[index].displayIcon),
                        fit: BoxFit.fitWidth),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(
                          int.parse('0x'
                              '${valo?[index].backgroundGradientColors[3]}'),
                        ),
                        Color(
                          int.parse('0x'
                              '${valo?[index].backgroundGradientColors[0]}'),
                        ),
                      ],
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valo?[index].displayName,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white30,
                        ),
                        child: Text(valo?[index].role?.assetPath ?? '',
                            textScaleFactor: 0.9),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 25,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            '// BIOGRAPHY',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            valo?[index].description,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white70),
                          ),
                          const Text(
                            '// SPECIAL ABILITIES',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AbilityTile(
                            logourl:
                                valo?[index].abilities[0].displayIcon ?? "",
                            subtitle: valo?[index].abilities[0].description,
                            title: valo?[index].abilities[0].displayName,
                          ),
                          AbilityTile(
                            logourl:
                                valo?[index].abilities[1].displayIcon ?? "",
                            subtitle: valo?[index].abilities[1].description,
                            title: valo?[index].abilities[1].displayName,
                          ),
                          AbilityTile(
                            logourl:
                                valo?[index].abilities[2].displayIcon ?? "",
                            subtitle: valo?[index].abilities[2].description,
                            title: valo?[index].abilities[2].displayName,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Hero(
              tag: 'DemoTag$index',
              child: Container(
                height: 230,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(portrait),
                      fit: BoxFit.fitHeight),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.45, sigmaY: 0.45),
                    child: Container(
                      color: Colors.transparent.withOpacity(0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
