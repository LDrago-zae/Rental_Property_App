import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewConnects extends StatelessWidget {
  const ViewConnects({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff015c4e),
        appBar: AppBar(
          backgroundColor: const Color(0xff015c4e),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'View Connects',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        body: Column(
          children: [
            Text(
              'Your available Connects',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
