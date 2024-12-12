import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_app/Screens/profile_screen.dart';

class PostPropertyScreen extends StatefulWidget {
  const PostPropertyScreen({super.key});

  @override
  State<PostPropertyScreen> createState() => _PostPropertyScreenState();
}

class _PostPropertyScreenState extends State<PostPropertyScreen> {
  int currentStep = 1; // Starting at step 1

  // Dropdown and text field values for Step 1
  final Map<String, List<String>> step1DropdownOptions = {
    'Division': ['Dhaka', 'Chattogram', 'Sylhet'],
    'District': ['District A', 'District B', 'District C'],
    'Area': ['Area 1', 'Area 2', 'Area 3'],
  };
  final Map<String, String?> step1SelectedValues = {
    'Division': null,
    'District': null,
    'Area': null,
  };
  final TextEditingController sectorController = TextEditingController();
  final TextEditingController roadController = TextEditingController();
  final TextEditingController houseNoController = TextEditingController();
  final TextEditingController houseNameController = TextEditingController();

  // Price Section for Step 2
  final TextEditingController priceController = TextEditingController();
  final Map<String, String?> priceDropdownOptions = {
    'Price For': 'Rent',
  };
  final List<String> includedBills = ['Electricity Bill', 'Gas', 'Water Bill'];
  final List<bool> isBillIncluded = [false, false, false];

  // Feature Section for Step 3
  final List<String> features = ['LIFT', 'GARAGE', 'CCTV', 'GAS', 'WATER'];
  final List<bool> isFeatureSelected = [false, false, false, false, false];
  final TextEditingController descriptionController = TextEditingController();

  void moveToNextStep() {
    if (currentStep < 4) {
      setState(() {
        currentStep++;
      });
    } else {
      _showSubmitDialog(); // Show dialog on Submit
    }
  }

  void moveToPreviousStep() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
    }
  }

  void _showSubmitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Are you sure?',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'To post your Flat for rent, it costs 10 Connects.',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "It's a quick and efficient way to find the perfect tenant!",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFEFF4F8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'No',
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                ); // Close the dialog
                // Perform submission logic here
                print('Form submitted!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF005846),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Yes',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 243, 230),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Post Your Property',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Step Indicator
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 4; i++) _buildStepIndicator(i),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Conditional Fields Based on Step
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildStepFields(),
            ),
          ),
          // Navigation Buttons
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 1)
                  ElevatedButton(
                    onPressed: moveToPreviousStep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Back',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: moveToNextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF005846),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    currentStep < 4 ? 'Next' : 'Submit',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step) {
    bool isChecked = step < currentStep;
    bool isActive = step == currentStep;

    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: isChecked || isActive
              ? const Color(0xFF005846)
              : const Color(0xFFEFF4F8),
          child: isChecked
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : Text(
                  '$step',
                  style: GoogleFonts.montserrat(
                    color: isActive ? Colors.white : Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
        if (step != 4) const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildStepFields() {
    // Same as your code for building step fields
    switch (currentStep) {
      case 1:
        return Column(
          children: [
            for (var field in step1DropdownOptions.keys)
              _buildDropdownField(field, step1DropdownOptions[field]!),
            _buildTextField('Sector No', sectorController),
            _buildTextField('Road No', roadController),
            _buildTextField('House No', houseNoController),
            _buildTextField('House Name', houseNameController),
          ],
        );
      case 2:
        return Column(
          children: [
            _buildTextField('Price', priceController),
            _buildDropdownField('Price For', ['Rent', 'Sale']),
            const SizedBox(height: 16),
            Text(
              'Price Included with',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Wrap(
              spacing: 8.0,
              children: List.generate(
                includedBills.length,
                (index) => FilterChip(
                  label: Text(includedBills[index]),
                  selected: isBillIncluded[index],
                  onSelected: (selected) {
                    setState(() {
                      isBillIncluded[index] = selected;
                    });
                  },
                ),
              ),
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            Text(
              'Feature',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Wrap(
              spacing: 8.0,
              children: List.generate(
                features.length,
                (index) => FilterChip(
                  label: Text(features[index]),
                  selected: isFeatureSelected[index],
                  onSelected: (selected) {
                    setState(() {
                      isFeatureSelected[index] = selected;
                    });
                  },
                ),
              ),
            ),
            _buildTextField('Description', descriptionController, maxLines: 4),
          ],
        );
      case 4:
        return Column(
          children: [
            const Icon(Icons.image, size: 100, color: Colors.grey),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF005846),
              ),
              child: const Text('Upload Picture'),
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildDropdownField(String label, List<String> options) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDFE6ED)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(border: InputBorder.none),
        isExpanded: true,
        value: step1SelectedValues[label],
        hint: Text(
          label,
          style: GoogleFonts.montserrat(
            color: const Color(0xFF9AA5B1),
            fontSize: 14,
          ),
        ),
        items: options
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(option, style: GoogleFonts.montserrat()),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            step1SelectedValues[label] = value;
          });
        },
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDFE6ED)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: GoogleFonts.montserrat(),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: GoogleFonts.montserrat(
            color: const Color(0xFF9AA5B1),
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
