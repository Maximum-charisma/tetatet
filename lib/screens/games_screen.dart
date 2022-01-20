import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tetatet/screens/game_card.dart';
import 'package:tetatet/screens/info_game.dart';
import 'package:tetatet/services/app_bar.dart';
import 'package:tetatet/services/network.dart';
import 'package:tetatet/services/objects.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  bool _loading = true;
  PacksModel? _games;

  @override
  void initState() {
    super.initState();
    Network.getGames('test').then((packs) {
      setState(() {
        _games = packs;
        _loading = false;
        if (packs.code != '0') {
          _loading = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          StandartAppBar(
            title: Text(
              'Выберите игру',
              style: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(144, 105, 250, 1),
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     padding: const EdgeInsets.only(top: 20),
          //     child: Text(
          //       'Популярные',
          //       style: GoogleFonts.comfortaa(
          //         textStyle: const TextStyle(
          //           color: Colors.black,
          //           fontSize: 18,
          //         ),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // )
          _getGames(),
        ],
      ),
    );
  }

  Widget _getGames() {
    if (_loading) {
      return const SliverToBoxAdapter(
        child: SizedBox(
          height: 600,
          child: CupertinoActivityIndicator(),
        ),
      );
    }
    if (_games!.pack.isEmpty) {
      SliverToBoxAdapter(
        child: Container(
          height: 600,
          alignment: Alignment.center,
          child: const Text(
            'Доступных игр пока что нет(',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var game = _games!.pack
              .where((element) => element.popularity == '1')
              .toList()[index];
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: GameCard(
                game: game,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // fullscreenDialog: true,
                          builder: (context) => InfoScreen(game: game)));
                }),
          );
        },
        childCount:
            _games!.pack.where((element) => element.popularity == '1').length,
      ),
    );
  }
}
