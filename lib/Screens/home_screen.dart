import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Import your other screens as before
import 'package:rent_app/Screens/PropertyDetailScreen.dart';
import 'package:rent_app/Screens/filter_screen.dart';
import 'package:rent_app/Screens/post_property.dart';
import 'package:rent_app/Screens/profile_screen.dart';
import 'package:rent_app/Screens/results_screen.dart';
import 'package:rent_app/database/database_helper.dart';
import 'chatscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  String selectedCategory = 'Family';
  int _selectedIndex = 0;
  List<Map<String, dynamic>> houses = [];

  @override
  void initState() {
    super.initState();
    _loadHouses();
  }

  Future<void> _loadHouses() async {
    final dbHelper = DatabaseHelper.instance;

    // Sample data insertion for demo (remove in production)
    await dbHelper.insertHouse(
      imageUrl:
      'https://img.freepik.com/free-photo/luxury-pool-villa-spectacular-contemporary-design-digital-art-real-estate-home-house-property-ge_1258-150765.jpg',
      title: 'Dreamsville House',
      price: '\$3,850',
      location: 'Jl. Sultan Iskandar Muda',
    );
    await dbHelper.insertHouse(
      imageUrl:
      'https://img.freepik.com/free-photo/luxury-pool-villa-spectacular-contemporary-design-digital-art-real-estate-home-house-property-ge_1258-150749.jpg',
      title: 'Dream Haven',
      price: '\$4,200',
      location: 'Jl. Dream Boulevard',
    );

    // Fetch houses from SQLite
    final houseList = await dbHelper.getHouses();
    setState(() {
      houses = houseList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.04;
    final double headerFont = screenSize.width * 0.06;
    final double recentCardHeight = screenSize.height * 0.22;
    final double bottomBarHeight = screenSize.height * 0.09;
    final double navIconSize = screenSize.width * 0.08;

    return Scaffold(
      backgroundColor: const Color(0xff015c4e),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: EdgeInsets.only(top: padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find Your',
                          style: GoogleFonts.montserrat(
                            fontSize: headerFont,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Dream House',
                          style: GoogleFonts.montserrat(
                            fontSize: headerFont,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: navIconSize + 6,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),

              // Search Bar and Filters
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Colors.blueGrey,
                          size: navIconSize,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: screenSize.height * 0.017),
                      ),
                    ),
                  ),
                  SizedBox(width: padding),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff97be04),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.filter_alt_outlined,
                          color: Colors.white, size: navIconSize),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FilterScreen()));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.018),

              // Category Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildCategoryChip('Bachelor'),
                    buildCategoryChip('Family'),
                    buildCategoryChip('Office'),
                    buildCategoryChip('Sublet'),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.018),

              // Recent Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.038,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.012),
              SizedBox(
                height: recentCardHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: houses.length,
                  itemBuilder: (context, index) {
                    final house = houses[index];
                    return HouseCard(
                      imageUrl: house['imagePath'],
                      title: house['title'],
                      price: house['price'],
                      location: house['location'],
                      cardWidth: screenSize.width * 0.68,
                      cardHeight: recentCardHeight,
                    );
                  },
                ),
              ),
              SizedBox(height: screenSize.height * 0.018),

              // Best from You Section
              Padding(
                padding: EdgeInsets.only(left: padding * 0.5),
                child: Text(
                  'Best from you',
                  style: GoogleFonts.montserrat(
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.012),
              Card(
                elevation: 12,
                margin: EdgeInsets.symmetric(horizontal: padding),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.045),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(screenSize.width * 0.045),
                      ),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/luxurious-villa-with-modern-architectural-design_23-2151694017.jpg',
                        height: screenSize.height * 0.26,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Luxury Retreat',
                            style: GoogleFonts.montserrat(
                              fontSize: screenSize.width * 0.046,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.009),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: Colors.grey, size: navIconSize - 3),
                              SizedBox(width: 4),
                              Text(
                                'Jl. Sunset Paradise',
                                style: GoogleFonts.montserrat(
                                  fontSize: screenSize.width * 0.032,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.014),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$5,300',
                                style: GoogleFonts.montserrat(
                                  fontSize: screenSize.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff015c4e),
                                ),
                              ),
                              Text(
                                'Monthly Rent',
                                style: GoogleFonts.montserrat(
                                  fontSize: screenSize.width * 0.037,
                                  color: const Color(0xff015c4e),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff97be04),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        screenSize.width * 0.055),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.width * 0.045,
                                    vertical: screenSize.height * 0.013,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const PropertyDetailscreen();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  'See Details',
                                  style: GoogleFonts.montserrat(
                                    fontSize: screenSize.width * 0.035,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff015c4e),
                                  ),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(padding * 2),
        child: Container(
          height: bottomBarHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenSize.width * 0.1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_max_outlined, 0, navIconSize),
              _buildNavItem(Icons.favorite_border, 1, navIconSize),
              _buildNavItem(Icons.add_circle_outline, 2, navIconSize),
              _buildNavItem(Icons.chat_bubble_outline_rounded, 3, navIconSize),
              _buildNavItem(Icons.person_outline, 4, navIconSize),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryChip(String category) {
    final Size screenSize = MediaQuery.of(context).size;
    bool isSelected = selectedCategory == category;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.01),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = category;
          });
        },
        child: Chip(
          label: Text(
            category,
            style: GoogleFonts.montserrat(
              color: isSelected ? Colors.white : Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: screenSize.width * 0.04,
            ),
          ),
          backgroundColor:
          isSelected ? const Color(0xff97be04) : const Color(0xff015c4e),
          padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.005,
            horizontal: screenSize.width * 0.035,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, double iconSize) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        // Navigation logic as before
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostPropertyScreen(),
            ),
          );
        }
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ChatScreen(
                  isOwner: false,
                )),
          );
        }
        if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        }
      },
      child: Container(
        width: iconSize * 1.6,
        height: iconSize * 1.6,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff97be04) : Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : const Color(0xff015c4e),
          size: iconSize,
        ),
      ),
    );
  }
}

// Responsive HouseCard widget
class HouseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String location;
  final double cardWidth;
  final double cardHeight;

  const HouseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.location,
    required this.cardWidth,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(right: cardWidth * 0.06),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardWidth * 0.08),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(cardWidth * 0.08),
            child: Image.file(
              File(imageUrl),
              height: cardHeight,
              width: cardWidth,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text('Image not found'));
              },
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(cardWidth * 0.08),
            child: Container(
              height: cardHeight,
              width: cardWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: cardHeight * 0.07,
            left: cardWidth * 0.06,
            right: cardWidth * 0.06,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: cardWidth * 0.075,
                  ),
                ),
                SizedBox(height: cardHeight * 0.02),
                Text(
                  location,
                  style: GoogleFonts.montserrat(
                    color: Colors.white70,
                    fontSize: cardWidth * 0.052,
                  ),
                ),
                SizedBox(height: cardHeight * 0.018),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: cardWidth * 0.07,
                      ),
                    ),
                    Text(
                      'Monthly Rent',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: cardWidth * 0.052,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
