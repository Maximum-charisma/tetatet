import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tetatet/screens/about_screen.dart';
import 'package:tetatet/screens/policy_screen.dart';
import 'package:tetatet/screens/settings_card.dart';
import 'package:tetatet/services/app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          StandartAppBar(
            title: Text(
              'Настройки',
              style: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(144, 105, 250, 1),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SettingsCard(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => PolicyScreen(),
                    ),
                  ),
                  label: 'Конфиденциальность',
                ),
                SettingsCard(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => AboutScreen(),
                    ),
                  ),
                  label: 'Поддержка',
                ),
                SettingsCard(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => AboutScreen(),
                    ),
                  ),
                  label: 'О нас',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
