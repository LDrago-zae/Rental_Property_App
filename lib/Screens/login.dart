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
      MaterialPageRoute(builder: (context) => GuestHomeScreen()),
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
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/logo.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(width: 0),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Color(0xff015c4e),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
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
              SizedBox(height: 40),
              Text(
                "Sign in your account",
                style: TextStyle(
                  color: Color(0xff015c4e),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(right: 270),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
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
                        underline: SizedBox(),
                        dropdownColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: Colors.black12,
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "1234567890",
                            hintStyle: TextStyle(fontWeight: FontWeight.normal),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 250),
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 20, bottom: 20),
                child: Container(
                  color: Colors.black12,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "********",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  signIn(selectedCountryCode, phoneController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff97be04),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Color(0xff015c4e),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'or sign in with',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              SizedBox(height: 20),
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
                  SizedBox(width: 15),
                  Container(
                    color: Colors.black12,
                    child: IconButton(
                      icon: Image.asset('assets/icons/facebook.png'),
                      iconSize: 40,
                      onPressed: signInWithFacebook,
                    ),
                  ),
                  SizedBox(width: 15),
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
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                        return Signin();
                      }));
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
              SizedBox(height: 18),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guest Home"),
      ),
      body: Center(
        child: Text(
          "Welcome, Guest User!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
