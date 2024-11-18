import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_app/Screens/home_screen.dart';
import 'package:rent_app/Screens/signin.dart';

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

  void signInWithGoogle() {
    print("Signing in with Google");
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 30),
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
                      const SizedBox(width: 0),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                            TextSpan(
                              text: 'Home',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff015c4e),
                              ),
                            ),
                            TextSpan(
                              text: 'Rent',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff97be04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Sign in to your account",
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff015c4e),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: Text(
                    "Phone",
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
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
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 230),
                  child: Text(
                    "Password",
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    signIn(selectedCountryCode, phoneController.text,
                        passwordController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff97be04),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
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
                const SizedBox(height: 20),
                Text(
                  'or Sign In with',
                  style: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIconButton(
                        'assets/icons/google.png', signInWithGoogle),
                    const SizedBox(width: 15),
                    _buildSocialIconButton(
                        'assets/icons/facebook.png', signInWithFacebook),
                    const SizedBox(width: 15),
                    _buildSocialIconButton('assets/icons/twitter.png', () {
                      print("Signing in with Twitter");
                    }),
                  ],
                ),
                const SizedBox(height: 25),
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
                const SizedBox(height: 18),
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
