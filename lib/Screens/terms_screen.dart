import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Terms and Policies',
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection("User Agreement", "A legal document outlining the terms and conditions of using the app, including user responsibilities and app ownership."),
            buildSection("Property Listings", "Information about the properties available for rent, including photos, descriptions, and rental terms."),
            buildSection("Tenant Screening", "Policies and procedures for tenant screening, including background checks, credit checks, and references."),
            buildSection("Rent Payment", "Methods of rent payment accepted through the app, such as credit/debit cards, bank transfers, or online payment services."),
            buildSection("Security Deposit", "Information about the security deposit required for renting a property and how it is handled."),
            buildSection("Lease Agreement", "Access to a digital lease agreement outlining the terms and conditions of renting a property through the app."),
            buildSection("Maintenance Requests", "Procedures for submitting maintenance requests through the app and the response time for addressing maintenance issues."),
            buildSection("Subleasing", "Policies regarding whether subleasing is allowed through the app, and any associated fees or procedures."),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}