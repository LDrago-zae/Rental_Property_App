import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_app/Screens/chatscreen.dart';
import 'package:rent_app/Screens/profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';



class PropertyDetailscreen extends StatefulWidget {
  const PropertyDetailscreen({super.key});

  @override
  State<PropertyDetailscreen> createState() => _PropertyDetailscreenState();
}

class _PropertyDetailscreenState extends State<PropertyDetailscreen> {
  bool isUnlocked = false;
  bool isReadMore = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff015c4e),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                    items: [
                      'https://img.freepik.com/free-photo/luxurious-villa-with-modern-architectural-design_23-2151694017.jpg',
                      'https://myhomemyzone.com/wp-content/uploads/2020/09/inc11.jpg',
                    ].map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.network(
                              imageUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      mini: true,
                      backgroundColor: const Color(0xffa5c0d5),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: FloatingActionButton(
                      onPressed: () {
                        // Add bookmark functionality here
                      },
                      mini: true,
                      backgroundColor: const Color(0xffa5c0d5),
                      child: const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xff015c4e),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                // height: 560,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Luxury Retreat',
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      color: Colors.lightGreenAccent,
                                      size: 14,
                                    ),
                                    Text(
                                      'Jl. Sunset,',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Paradise',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.square_foot,
                                      color: Colors.lightGreenAccent,
                                      size: 14,
                                    ),
                                    Text(
                                      '3480 Sq.Ft',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        isReadMore
                            ? 'Welcome to Your New Home! This modern and spacious 2-Bedroom apartment is located in the heart of Paradise, offering convenience, comfort, and endless luxury for your lifestyle. Enjoy breathtaking views, modern amenities, and top-notch design.'
                            : 'Welcome to Your New Home! This modern and spacious 2-Bedroom apartment is located in the heart of Paradise, offering convenience, comfort, and...',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isReadMore = !isReadMore;
                        });
                      },
                      child: Text(
                        isReadMore ? 'Show Less' : 'Read More...',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff1d6a5f),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xff49887f),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Icon(
                                          Icons.bed,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(width: 4),
                                    Text(
                                      "2 Bedroom",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.lightGreenAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff1d6a5f),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xff49887f),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Icon(
                                          Icons.bathtub,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(width: 4),
                                    Text(
                                      "3 Bathroom",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.lightGreenAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff1d6a5f),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xff49887f),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Icon(
                                          Icons.directions_car_filled,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Parking",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.lightGreenAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (!isUnlocked)
                      Container(
                        width: 350,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Content is locked",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    if (isUnlocked)
                      Column(
                        children: [
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/150?img=12',
                              ),
                            ),
                            title: Text(
                              'William Henry',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Owner',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 12),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 2), // White border
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  // Optional padding for better spacing
                                  child: GestureDetector(onTap: () async {

                                      final Uri url = Uri(
                                        scheme: "tel",
                                        path: "452 869 8569",
                                      );
                                      if(await canLaunchUrl(url)){
                                      await launchUrl(url);}
                                      else{print("cannot launch this url");}

                                  },child: Icon(Icons.phone, color: Colors.white)),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 2), // White border
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  // Optional padding for better spacing
                                  child: GestureDetector(
                                    child:
                                        Icon(Icons.chat, color: Colors.white),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return ChatScreen(isOwner: true);
                                      }));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.blueGrey,
                            child: Center(
                              child: Text(
                                'Map showing location of property',
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '\$5,300',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Monthly Rent',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff97be04),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          onPressed: () {
                            if (!isUnlocked) {
                              // Show dialog to confirm unlocking
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Are you sure?',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff015c4e),
                                      ),
                                    ),
                                    content: RichText(
                                      text: TextSpan(
                                        text:
                                            'To access locked information, it costs ',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: Color(0xff015c4e),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '10 Connects.', // Bold part
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff015c4e),
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '                                             ',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Color(0xff015c4e),
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Upon unlocking, you will receive the property address and owner details.',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Color(0xff015c4e),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color(0xffd6fff6)),
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'No',
                                                style: GoogleFonts.montserrat(
                                                  color: Color(0xff015c4e),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0xff015c4e),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  isUnlocked =
                                                      true; // Unlock the contact
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Yes',
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              // Navigate directly to the ChatScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChatScreen(isOwner: false)),
                              );
                            }
                          },
                          child: Text(
                            isUnlocked ? 'Contact' : 'Unlock Contact',
                            style: GoogleFonts.montserrat(
                                color: const Color(0xff015c4e),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
