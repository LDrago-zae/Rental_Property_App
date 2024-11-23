import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.bold
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child:  IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height:200, child:  Image.asset("assets/help.png",fit: BoxFit.fill,)),
            ),
        
        
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration( color: Color(0xffe4edeb),borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  leading:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,child: Icon(Icons.location_pin,color: Color(0xFFB5E307),),
                    ),
                  ),
                  title: Text("5678 Elm Avenue,",style: GoogleFonts.montserrat(color: Color(
                      0xff045a4d),fontWeight: FontWeight.bold),),
                  subtitle:Text("San Francisco, CA 94102",style: GoogleFonts.montserrat(color: Color(
                      0xff045a4d),),),
        
                ),
        
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration( color: Color(0xffe4edeb),borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  leading:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,child: Icon(Icons.location_pin,color: Color(0xFFB5E307),),
                    ),
                  ),
                  title: Text("Phone",style: GoogleFonts.montserrat(color: Color(
                      0xff045a4d),fontWeight: FontWeight.bold),),
                  subtitle:Text("(555)123-54567",style: GoogleFonts.montserrat(color: Color(
                      0xff045a4d),),),
        
                ),
        
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration( color: Color(0xffe4edeb),borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  leading:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,child: Icon(Icons.location_pin,color: Color(0xFFB5E307),),
                    ),
                  ),
                  title: Text("Email Us",style: GoogleFonts.montserrat(color: Color(
                      0xff045a4d),fontWeight: FontWeight.bold),),
                  subtitle:Text("support@homerent.com",style: GoogleFonts.montserrat(color: Color(
                      0xff045a4d),),),
        
                ),
        
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
