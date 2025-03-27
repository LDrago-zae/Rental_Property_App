import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_app/Screens/home_screen.dart';
import 'package:rent_app/Screens/signin.dart';
import 'package:rent_app/services/supabase_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedCountryCode = "+92"; // Default country code

  void signIn(String countryCode, String phone, String password) {
    print("Signing in with phone: $countryCode $phone and password: $password");
  }

  Future<void> signInWithGoogle() async {
    try {
      await SupabaseService().googleSignIn(); // Ensure this function is implemented in SupabaseService
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }

  void signInWithFacebook() {
    print("Signing in with Facebook");
  }

  void signInAsGuest(BuildContext context) {
    print("Signing in as Guest");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GuestHomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic padding values based on screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // 5% of screen width
              vertical: screenHeight * 0.02, // 2% of screen height
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.08, // 8% of screen height
                    right: screenWidth * 0.08, // 8% of screen width
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/logo.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            fontSize: screenWidth * 0.08,
                            fontWeight: FontWeight.w700,
                          ),
                          children: const [
                            TextSpan(
                              text: 'Home',
                              style: TextStyle(color: Color(0xff015c4e)),
                            ),
                            TextSpan(
                              text: 'Rent',
                              style: TextStyle(color: Color(0xff97be04)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Sign in to your account",
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff015c4e),
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.65),
                  child: Text(
                    "Phone",
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: selectedCountryCode,
                          items: <String>['+92', '+1', '+44', '+61']
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
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "1234567890",
                              hintStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.normal,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
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
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.6),
                  child: Text(
                    "Password",
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "********",
                          hintStyle: GoogleFonts.montserrat(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton(
                  onPressed: () {
                    signIn(selectedCountryCode, phoneController.text,
                        passwordController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff97be04),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.09, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xff015c4e),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'or Sign In with',
                  style: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIconButton(
                        'assets/icons/google.png', () async {
                      try {
                        await signInWithGoogle();

                        if(!mounted) return;

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      } catch (e) {
                        print("Google Sign-In Error: $e");
                      }
                    },
                    ),
                    const SizedBox(width: 15),
                    _buildSocialIconButton(
                        'assets/icons/facebook.png', signInWithFacebook),
                    const SizedBox(width: 15),
                    _buildSocialIconButton('assets/icons/twitter.png', () {
                      print("Signing in with Twitter");
                    }),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.montserrat(
                          color: Colors.black45, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        'SIGN UP',
                        style: GoogleFonts.montserrat(
                          color: Colors.green[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                GestureDetector(
                  onTap: () {
                    signInAsGuest(context);
                  },
                  child: Text(
                    'GUEST USER',
                    style: GoogleFonts.montserrat(
                      color: Colors.green[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIconButton(String assetPath, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade400,
          width: 2,
        ),
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: Image.asset(
              assetPath,
              width: 40,
              height: 40,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

// Guest Home Screen Example
class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guest Home"),
      ),
      body: const Center(
        child: Text(
          "Welcome, Guest User!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
