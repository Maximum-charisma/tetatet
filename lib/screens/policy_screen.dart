import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tetatet/services/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyScreen extends StatefulWidget {
  PolicyScreen({Key? key}) : super(key: key);

  @override
  _PolicyScreenState createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Политика',
          style: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(144, 105, 250, 1),
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: WebView(
          initialUrl: 'https://tetatet.fun/policyAndPrivacy/',
        ),
      ),
    );
  }
}
