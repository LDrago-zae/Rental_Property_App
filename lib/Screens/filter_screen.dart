import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedPropertyType = 'Family';
  List<String> features = ['LIFT', 'GARAGE', 'CCTV', 'GAS'];
  List<bool> selectedFeatures = [false, false, false, false];
  int selectedBedrooms = 0;
  int selectedBathrooms = 0;

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
            'Filter',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Reset filter logic here
              },
              child: Text(
                'Reset',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Types Section
              Text(
                'Property types',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Allow horizontal scrolling
                child: Row(
                  children: [
                    buildPropertyTypeChip('Bachelor'),
                    const SizedBox(width: 10), // Add spacing between chips
                    buildPropertyTypeChip('Family'),
                    const SizedBox(width: 10),
                    buildPropertyTypeChip('Office'),
                    const SizedBox(width: 10),
                    buildPropertyTypeChip('Sublet'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Price Range Section
              Text(
                'Price range',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Minimum',
                        hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Maximum',
                        hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Bedrooms Section
              Text(
                'Bedrooms',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              buildNumberSelector(8, selectedBedrooms, (value) {
                setState(() {
                  selectedBedrooms = value;
                });
              }),
              const SizedBox(height: 20),

              // Bathrooms Section
              Text(
                'Bathrooms',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              buildNumberSelector(8, selectedBathrooms, (value) {
                setState(() {
                  selectedBathrooms = value;
                });
              }),
              const SizedBox(height: 20),

              // Features Section
              Text(
                'Feature',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children: List.generate(features.length, (index) {
                  return ChoiceChip(
                    label: Text(
                      features[index],
                      style: GoogleFonts.montserrat(
                        color: selectedFeatures[index]
                            ? Colors.white
                            : const Color(0xff015c4e),
                      ),
                    ),
                    selected: selectedFeatures[index],
                    onSelected: (isSelected) {
                      setState(() {
                        selectedFeatures[index] = isSelected;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: const Color(0xff97be04),
                  );
                }),
              ),
              const SizedBox(height: 30),

              // Show Property Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Apply filter logic here
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    backgroundColor: const Color(0xff97be04),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Show Property',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0xff015c4e),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPropertyTypeChip(String category) {
    bool isSelected = selectedPropertyType == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPropertyType = category;
        });
      },
      child: Chip(
        label: Text(
          category,
          style: GoogleFonts.montserrat(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor:
        isSelected ? const Color(0xff97be04) : const Color(0xff015c4e),
      ),
    );
  }

  Widget buildNumberSelector(
      int max, int selectedValue, Function(int) onSelected) {
    return Wrap(
      spacing: 8,
      children: List.generate(max, (index) {
        return ChoiceChip(
          label: Text(
            index == max - 1 ? '$index+' : '${index + 1}',
            style: GoogleFonts.montserrat(
              color: selectedValue == index
                  ? Colors.white
                  : const Color(0xff015c4e),
            ),
          ),
          selected: selectedValue == index,
          onSelected: (_) {
            onSelected(index);
          },
          backgroundColor: Colors.white,
          selectedColor: const Color(0xff97be04),
        );
      }),
    );
  }
}
