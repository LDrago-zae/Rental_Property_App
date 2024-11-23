import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  // Dynamic property list
  final List<Map<String, String>> properties = [
    {
      'imageUrl': 'https://img.freepik.com/free-photo/house-isolated-field_1303-23773.jpg?t=st=1732383764~exp=1732387364~hmac=f940de6f76adc144c79e7141c7592ac7d754edf40cb26a41d5ae630943a5e4c5&w=1380',
      'title': 'Prestige Grand Apartment',
      'location': 'San Francisco, California',
      'price': '\$3,000/month',
    },
    {
      'imageUrl': 'https://img.freepik.com/free-photo/luxurious-villa-with-modern-architectural-design_23-2151694124.jpg?t=st=1732383713~exp=1732387313~hmac=c18729fa06508cdaf60a2c54a6827530c02152434351059f42ea35ccd206d06a&w=1380',
      'title': 'Riverside Manor Residences',
      'location': 'Los Angeles, California',
      'price': '\$2,800/month',
    },
    {
      'imageUrl': 'https://img.freepik.com/free-photo/3d-rendering-house-model_23-2150799695.jpg?t=st=1732383628~exp=1732387228~hmac=b7e00420936b62c822345a344b75e2894184ddd2bcee58930ad71f5d83e80b12&w=1480',
      'title': 'Pineview Terrace Towers',
      'location': 'New York, USA',
      'price': '\$5,000/month',
    },
  ];

  int _selectedIndex = 0; // For bottom navigation selection

  // Navigation item builder
  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff97be04) : Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : const Color(0xff015c4e),
          size: 28,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
             Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search for properties...",
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Dynamic Results Title
            Text(
              "${properties.length} Results..",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff015c4e),
              ),
            ),
            const SizedBox(height: 20),

            // Dynamic Property Cards
            Expanded(
              child: ListView.builder(
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  final property = properties[index];
                  return Column(
                    children: [
                      PropertyCard(
                        imageUrl: property['imageUrl']!,
                        title: property['title']!,
                        location: property['location']!,
                        price: property['price']!,
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
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
              _buildNavItem(Icons.home_max_outlined, 0),
              _buildNavItem(Icons.favorite_border, 1),
              _buildNavItem(Icons.add_circle_outline, 2),
              _buildNavItem(Icons.chat_bubble_outline_rounded, 3),
              _buildNavItem(Icons.person_outline, 4),
            ],
          ),
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;

  const PropertyCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image with Bookmark Icon
          Stack(
            children: [
              // Property Image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Bookmark Icon
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: IconButton(
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: Colors.teal,
                    ),
                    onPressed: () {
                      // Handle save or bookmark action here
                      print("Bookmark button pressed for $title");
                    },
                  ),
                ),
              ),
            ],
          ),

          // Property Info
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
