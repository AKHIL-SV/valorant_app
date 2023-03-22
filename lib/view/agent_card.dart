import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:valorant_app/view/info_page.dart';
import 'package:valorant_app/view/utls/constants.dart';

class AgentCards extends StatelessWidget {
  final List? valos;
  final bool isloading;

  const AgentCards({super.key, required this.valos, required this.isloading});

  @override
  Widget build(BuildContext context) {
    return isloading
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: valos?.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(
                            valo: valos,
                            index: index,
                            portrait: valos?[index].bustPortrait ?? img),
                      ),
                    );
                  },
                  child: Stack(children: [
                    Container(
                      padding: const EdgeInsets.only(top: 70, bottom: 30),
                      width: 180,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2),
                              BlendMode.dstATop,
                            ),
                            image: NetworkImage(
                              valos?[index].background ?? "",
                            ),
                            fit: BoxFit.cover,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(
                                int.parse('0x'
                                    '${valos?[index].backgroundGradientColors[3]}'),
                              ),
                              Color(
                                int.parse('0x'
                                    '${valos?[index].backgroundGradientColors[0]}'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'DemoTag$index',
                      child: Container(
                        height: 300,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  valos?[index].bustPortrait ?? img),
                              fit: BoxFit.fitHeight),
                        ),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 0.45, sigmaY: 0.45),
                            child: Container(
                              color: Colors.transparent.withOpacity(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      child: SizedBox(
                        height: 60,
                        width: 180,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(15)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.grey.withOpacity(0.1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    valos?[index].displayName ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(height: 3),
                                  Container(
                                    height: 1,
                                    width: 60,
                                    color: Colors.white70,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    valos?[index].role?.assetPath ?? '',
                                    style: const TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(color: valoRed),
          );
  }
}
