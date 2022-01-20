import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tetatet/services/constants.dart';
import 'package:tetatet/services/objects.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.game,
    required this.onTap,
  }) : super(key: key);

  final Pack game;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: radius,
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black12, offset: Offset(0, 0))
        ],
      ),
      child: Material(
        borderRadius: radius,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(borderRadius: radius),
                child: ClipRRect(
                  borderRadius: radius,
                  child: Image.network(
                    game.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                child: ClipRRect(
                  borderRadius: radius,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 3.0,
                      sigmaY: 3.0,
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        // decoration: const BoxDecoration(
                        //   color: Colors.white,
                        //   borderRadius: radius,
                        //   boxShadow: [
                        //     BoxShadow(
                        //         blurRadius: 5,
                        //         color: Colors.black12,
                        //         offset: Offset(0, 0))
                        //   ],
                        // ),
                        child: Text(game.name,
                            style: GoogleFonts.comfortaa(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: const Offset(
                                    0.0,
                                    0.5,
                                  ),
                                  blurRadius: 15.0,
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .foregroundColor!,
                                ),
                              ],
                              textStyle: TextStyle(
                                  color: Theme.of(context).backgroundColor,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w900),
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Text(
                        game.description,
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .appBarTheme
                                  .foregroundColor),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
