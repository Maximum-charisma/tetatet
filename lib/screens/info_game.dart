import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tetatet/screens/game_card.dart';
import 'package:tetatet/screens/game_screen.dart';
import 'package:tetatet/services/app_bar.dart';
import 'package:tetatet/services/constants.dart';
import 'package:tetatet/services/objects.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({Key? key, required this.game}) : super(key: key);
  Pack game;

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            StandartAppBar(
              title: Text(
                'Выбранная игра',
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Icon(
                    widget.game.lock == '1' ? Icons.lock_outline : null,
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: GameCard(
                  game: widget.game,
                  onTap: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Кол-во игроков: ',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          color: Colors.grey, fontSize: 15, height: 1.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Более 2',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          color: Colors.black, fontSize: 15, height: 1.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Text(
                  widget.game.about,
                  style: GoogleFonts.comfortaa(
                    textStyle: const TextStyle(
                        color: Colors.grey, fontSize: 20, height: 1.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.black26, offset: Offset(0, 0))
            ],
          ),
          width: 150,
          height: 50,
          child: Material(
            color: const Color.fromRGBO(144, 105, 250, 1),
            borderRadius: radius,
            child: InkWell(
              borderRadius: radius,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen(
                              image: widget.game.image,
                            )));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.game.lock == '1' ? 'Купить' : 'Играть',
                    style: GoogleFonts.comfortaa(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  Icon(
                    widget.game.lock == '0'
                        ? LineIcons.play
                        : LineIcons.wavyMoneyBill,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
