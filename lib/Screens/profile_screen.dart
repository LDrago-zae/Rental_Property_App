import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_app/Screens/editprofile_screen.dart';
import 'package:rent_app/Screens/help_screen.dart';
import 'package:rent_app/Screens/login.dart';
import 'package:rent_app/Screens/terms_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: GoogleFonts.montserrat(
                color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffd7e4e2),
                borderRadius: BorderRadius.circular(30)),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: Image.network(
                        'https://i.pravatar.cc/150?img=12',
                        fit: BoxFit.cover, // Ensures the image fits well
                        width: 100, // Matches the CircleAvatar's diameter
                        height: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'William Henry',
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff367a70)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        'San Francisco, California',
                        style: GoogleFonts.montserrat(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Text(
                        "Account",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: const Color(0xfff0f5f4),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.edit, color: Colors.black),
                          title: Text(
                            'Edit Profile',
                            style: GoogleFonts.montserrat(),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.security, color: Colors.black),
                          title: Text(
                            'Security',
                            style: GoogleFonts.montserrat(),
                          ),
                          onTap: () {},
                        ),
                        SwitchListTile(
                          activeTrackColor: const Color(0xff045347),
                          activeColor: Colors.white,
                          value: true,
                          onChanged: (value) {},
                          title: Text(
                            'Notifications',
                            style: GoogleFonts.montserrat(),
                          ),
                          secondary: const Icon(Icons.notifications,
                              color: Colors.black),
                        ),
                        ListTile(
                          leading: const Icon(Icons.connect_without_contact,
                              color: Colors.black),
                          title: Text(
                            'Connects',
                            style: GoogleFonts.montserrat(),
                          ),
                          trailing: Text(
                            '35',
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.privacy_tip,
                              color: Colors.black),
                          title: Text(
                            'Privacy',
                            style: GoogleFonts.montserrat(),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.lock, color: Colors.black),
                          title: Text(
                            'Unlocked Properties',
                            style: GoogleFonts.montserrat(),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Support & Policies",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: const Color(0xfff0f5f4),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.help, color: Colors.black),
                          title: Text(
                            'Help & Support',
                            style: GoogleFonts.montserrat(),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const HelpScreen();
                            }));
                          },
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.policy, color: Colors.black),
                          title: Text(
                            'Terms and Policies',
                            style: GoogleFonts.montserrat(),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const TermsScreen();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Actions",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: const Color(0xfff0f5f4),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.flag, color: Colors.black),
                          title: Text(
                            'Report a Problem',
                            style: GoogleFonts.montserrat(),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.logout, color: Colors.black),
                          title: Text(
                            'Logout',
                            style: GoogleFonts.montserrat(),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.all(
                                      8.0), // Remove the default padding
                                  backgroundColor: Colors
                                      .transparent, // Make the background transparent
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Center(
                                    child: Container(
                                      width: 350,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Question Mark Icon
                                          const Icon(
                                            Icons.help,
                                            size: 40,
                                            color: Color(0xff045a4d),
                                          ),
                                          const SizedBox(height: 16),

                                          // Question Text
                                          Text(
                                            'Are you sure  want to Logout?',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 20),

                                          // Buttons Row
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return const Login();
                                                    }));
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffe0f2ef),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Yes',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // Handle the logout action here
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog
                                                    // Add logout logic here
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff045a4d),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'No',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
