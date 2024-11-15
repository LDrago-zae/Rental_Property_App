import 'package:flutter/material.dart';
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
    return Scaffold(
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
                    const Text(
                      "Home",
                      style: TextStyle(
                        color: Color(0xff015c4e),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Rent",
                      style: TextStyle(
                        color: Color(0xff97be04),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Sign in your account",
                style: TextStyle(
                  color: Color(0xff015c4e),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.only(right: 270),
                child: Text(
                  "Phone",
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 20, bottom: 20),
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
                            child: Text(value),
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
                            hintStyle: const TextStyle(fontWeight: FontWeight.normal),
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
              const Padding(
                padding: EdgeInsets.only(right: 250),
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 20, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "********",
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
              ElevatedButton(
                onPressed: () {
                  signIn(selectedCountryCode, phoneController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff97be04),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Color(0xff015c4e),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'or Sign In with',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.black12,
                    child: IconButton(
                      icon: Image.asset('assets/icons/google.png'),
                      iconSize: 40,
                      onPressed: signInWithGoogle,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    color: Colors.black12,
                    child: IconButton(
                      icon: Image.asset('assets/icons/facebook.png'),
                      iconSize: 40,
                      onPressed: signInWithFacebook,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    color: Colors.black12,
                    child: IconButton(
                      icon: Image.asset('assets/icons/twitter.png'),
                      iconSize: 40,
                      onPressed: () {
                        print("Signing in with Twitter");
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp(),),);
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.green[700],
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
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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
