import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tetatet/services/constants.dart';

class SettingsCard extends StatefulWidget {
  SettingsCard({Key? key, required this.onTap, required this.label})
      : super(key: key);
  final String label;
  final Function() onTap;
  @override
  _SettingsCardState createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black12, offset: Offset(0, 0))
        ],
        borderRadius: radius,
      ),
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Material(
        borderRadius: radius,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: radius,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.label,
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
