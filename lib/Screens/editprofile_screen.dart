import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController(text: "William Henry");
  final phoneController = TextEditingController(text: "1234567890");
  final passwordController = TextEditingController(text: "123456");

  String selectedCountryCode = "+1"; // Default country code
  DateTime selectedDate = DateTime(1990, 5, 15); // Default date of birth
  String selectedCountryRegion = "San Francisco, California"; // Default region
  bool isPasswordVisible = false; // For password visibility toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: GoogleFonts.montserrat(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffd7e4e2),
              borderRadius: BorderRadius.circular(30),
            ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            const Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=12',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFB5E307),
                      radius: 16,
                      child:
                          Icon(Icons.camera_alt, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Name Field
            buildInputField(
              label: "Name",
              controller: nameController,
            ),
            const SizedBox(height: 16),

            // Phone Field
            Text(
              "Phone",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // Country Code Dropdown
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButton<String>(
                    value: selectedCountryCode,
                    items: <String>['+1', '+92', '+44', '+61']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.montserrat(),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountryCode = newValue!;
                      });
                    },
                    underline: const SizedBox(),
                    dropdownColor: Colors.grey.shade100,
                  ),
                ),
                const SizedBox(width: 10),

                // Phone Number Field
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Password Field
            buildInputField(
              label: "Password",
              controller: passwordController,
              obscureText: !isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),

            // Date of Birth Field
            buildInputField(
              label: "Date of Birth",
              controller: TextEditingController(
                  text:
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
              isReadOnly: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today, color: Colors.black),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // Country/Region Field
            buildInputField(
              label: "Country/Region",
              controller: TextEditingController(text: selectedCountryRegion),
              isReadOnly: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                onPressed: () {
                  // Add logic to open region picker
                },
              ),
            ),
            const SizedBox(height: 32),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save changes logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF025949),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save changes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create reusable input fields
  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    bool isReadOnly = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            readOnly: isReadOnly,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.transparent,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
