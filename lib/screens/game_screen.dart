import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tetatet/services/app_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tetatet/services/constants.dart';

class Content {
  final String? text;
  final Color? color;

  Content({this.text, this.color});
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = [
    'Макс, правда или действие?',
    'Макс, ...',
    'Макс, правда или действие?',
    'Макс, ...',
    'Макс, правда или действие?',
    'Макс, ...',
    'Макс, правда или действие?',
    'Макс, ...',
  ];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
        ),
        Container(
          width: double.infinity,
          child: Image.network(
            widget.image,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
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
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.8),
            title: Text(
              'Игра',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          body: Stack(
            children: [
              Center(
                child: SwipeCards(
                  matchEngine: _matchEngine!,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(30, 40, 30, 170),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).bottomAppBarColor,
                          borderRadius: radius,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 5,
                                color: Colors.black12,
                                offset: Offset(0, 0))
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '',
                          style: const TextStyle(fontSize: 100),
                        ),
                      ),
                    );
                  },
                  onStackFinished: () {
                    _scaffoldKey.currentState!.showSnackBar(const SnackBar(
                      content: Text("Stack Finished"),
                      duration: Duration(milliseconds: 500),
                    ));
                  },
                  itemChanged: (SwipeItem item, int index) {
                    print("item: ${item.content.text}, index: $index");
                  },
                  upSwipeAllowed: true,
                  fillSpace: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 45,
                        width: 110,
                        child: Material(
                          color: const Color.fromRGBO(144, 105, 250, 1),
                          borderRadius: radius,
                          child: InkWell(
                            borderRadius: radius,
                            onTap: () {
                              _matchEngine!.currentItem?.nope();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.arrow_left_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  'Правда',
                                  style: GoogleFonts.comfortaa(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 110,
                        child: Material(
                          color: const Color.fromRGBO(144, 105, 250, 1),
                          borderRadius: radius,
                          child: InkWell(
                            borderRadius: radius,
                            onTap: () {
                              _matchEngine!.currentItem?.superLike();
                            },
                            child: Center(
                              child: Text(
                                'Поменять',
                                style: GoogleFonts.comfortaa(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 110,
                        child: Material(
                          color: const Color.fromRGBO(144, 105, 250, 1),
                          borderRadius: radius,
                          child: InkWell(
                            borderRadius: radius,
                            onTap: () {
                              _matchEngine!.currentItem?.like();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Действие',
                                  style: GoogleFonts.comfortaa(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
