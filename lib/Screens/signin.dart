import 'package:flutter/material.dart';
import 'package:rent_app/Screens/login.dart';
import 'package:rent_app/Screens/signin.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController address = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0e212d),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color(0xff0e212d)),
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Create New Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 3),
                      child: TextFormField(

                          controller: name,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
                            labelText: "Name",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (String? txt) {
                            if (txt == null || txt.isEmpty)
                              return "Enter your name";
                          }),
                    ), //name
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 3),
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
                          }), //email
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 3),
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
                            else if (txt.length < 5)
                              return "Password must be of 5 characters";

                            return null;
                          }), //passw
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 3),
                      child: TextFormField(
                          obscureText: true,
                          obscuringCharacter: "*",
                          controller: confirmpassword,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
                            labelText: "Confirm Password ",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (String? txt) {
                            if (txt == null || txt.isEmpty)
                              return "Field Required";
                            else if (txt != password.text)
                              return "Password must be same as above";
                            return null;
                          }),
                    ), //cnpass
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 3),
                      child: TextFormField(
                          controller: phonenumber,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
                            labelText: "Phone Number",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (String? txt) {
                            if (txt == null || txt.isEmpty)
                              return "Enter your phone number";

                            return null;
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 3),
                      child: TextFormField(
                          controller: address,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
                            labelText: "Address",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (String? txt) {
                            if (txt == null || txt.isEmpty)
                              return "Enter your address";

                            return null;
                          }),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: _signin,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF000000),
                          foregroundColor: Colors.white,
                          shadowColor: Colors.white),
                      child: Text(
                        "Signin",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 75, top: 20),
                      child: Row(
                        children: [
                          Text(
                            "Already Have an Account?",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: Text(
                              "Login here",
                              style: TextStyle(
                                  color: Colors.lightBlueAccent, fontSize: 14),
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Login();
                              }));
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _signin() {
    if (formkey.currentState!.validate() == false) {
      return;
    }
  }
}
