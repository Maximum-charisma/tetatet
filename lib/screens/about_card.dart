import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutCard extends StatefulWidget {
  AboutCard({Key? key, required this.image, required this.text})
      : super(key: key);
  final String image;
  final String text;

  @override
  _AboutCardState createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 300, child: Image.network(widget.image)),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 20, 30, 50),
          child: Text(
            widget.text,
            style: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  fontSize: 18, color: Colors.black, height: 1.7),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
