import 'package:flutter/material.dart';
import 'package:rent_app/Screens/signin.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xff0e212d)),
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                      controller: email,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        labelText: "Email ",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: (String? txt) {
                        if (txt == null || txt.isEmpty)
                          return "Enter your email";
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: TextFormField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: password,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        labelText: "Password ",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: (String? txt) {
                        if (txt == null || txt.isEmpty)
                          return "Enter your password";

                        return null;
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF000000),
                      foregroundColor: Colors.white,
                      shadowColor: Colors.white),
                  child: Text(
                    "Login",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Don't Have an Account?",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: Text(
                          "Signin here",
                          style: TextStyle(
                              color: Colors.lightBlueAccent, fontSize: 14),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Signin();
                          }));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void _login() {
    if (formkey.currentState!.validate() == false) {
      return;
    }
  }
}
