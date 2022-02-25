import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTile extends StatelessWidget {
  final String title;

  const SectionTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          )),
    );
  }
}
