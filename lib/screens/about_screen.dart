import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tetatet/screens/about_card.dart';
import 'package:tetatet/services/app_bar.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          StandartAppBar(
            title: Text(
              'О нас',
              style: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(144, 105, 250, 1),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                AboutCard(
                  image: 'https://tetatet.fun/images/alena.png',
                  text:
                      'Алёна, составитель правды и действий, маркетолог, тик-токер и она самая младшая в нашей команде)',
                ),
                AboutCard(
                  image: 'https://tetatet.fun/images/nastya.png',
                  text:
                      'Настя, составитель правды и действий, занимается всеми нашими соц-сетями, отвечает на ваши вопросики, ибо остальные в нашей команде пишут с ошибками)',
                ),
                AboutCard(
                  image: 'https://tetatet.fun/images/vlad.png',
                  text:
                      'Влад, составитель правды и действий, придумывает для вас паки, и талисман нашей команды, который очень классно танцует! Заценить можете в тик токе)',
                ),
                AboutCard(
                  image: 'https://tetatet.fun/images/max.png',
                  text:
                      'Ну и собственно я, Макс. Разработчик, который написал всего один вопрос для вас, и полностью приложение. Back-End, Front-End, всю логику придумовал я один, так что, если будут косяки, сильно не ругайтесь) Иии мы это все перепишем, так как я наделал тут много ошибок)',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
