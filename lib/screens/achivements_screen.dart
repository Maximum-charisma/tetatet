import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tetatet/services/app_bar.dart';

class AchivementsScreen extends StatefulWidget {
  const AchivementsScreen({Key? key}) : super(key: key);

  @override
  _AchivementsScreenState createState() => _AchivementsScreenState();
}

class _AchivementsScreenState extends State<AchivementsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          StandartAppBar(
            title: Text(
              'Достижения',
              style: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(144, 105, 250, 1),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 600,
              child: Center(
                child: Text(
                  'В скором времени будут доступны :)',
                  style: GoogleFonts.comfortaa(
                    textStyle: const TextStyle(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
