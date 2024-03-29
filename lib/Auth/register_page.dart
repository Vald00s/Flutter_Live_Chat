import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Vald00s/Navigator/navigator.dart';
import 'package:Vald00s/Validator/fire_auth.dart';
import 'package:Vald00s/Validator/validator.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  String _location = "Surabaya";
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _locationTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  final _focusName = FocusNode();
  final _focusLocation = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusLocation.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Register',
          ),
        ),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 30, bottom: 30, left: 60, right: 60),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/3.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _nameTextController,
                        focusNode: _focusName,
                        validator: (value) => Validator.validateName(
                          name: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Username",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      //
                      //
                      /*
                      TextFormField(
                        controller: _locationTextController,
                        focusNode: _focusLocation,
                        validator: (value) => Validator.validateLocation(
                          location: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Location",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      */
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Email",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordTextController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) => Validator.validatePassword(
                          password: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Password",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: 350,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: "Location",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                          items: <String>[
                            'Surabaya',
                            'Sidoarjo',
                            'Mojokerto',
                            'Gresik',
                            'Pasuruan',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _location = value!;
                            });
                          },
                          hint: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Location",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final String name =
                                          _nameTextController.text.trim();
                                      final String location =
                                          _locationTextController.text.trim();
                                      final String email =
                                          _emailTextController.text.trim();
                                      final String password =
                                          _passwordTextController.text.trim();
                                      setState(() {
                                        _isProcessing = true;
                                      });
                                      if (_registerFormKey.currentState!
                                          .validate()) {
                                        User? user = await FireAuth
                                            .registerUsingEmailPassword(
                                          username: _nameTextController.text,
                                          location: _location,
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text,
                                        );
                                        setState(() {
                                          _isProcessing = false;
                                        });

                                        if (user != null) {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (context) => Navbar(),
                                            ),
                                            ModalRoute.withName('/'),
                                          )
                                              .then((value) async {
                                            User? auth = FirebaseAuth
                                                .instance.currentUser;
                                            user = auth;
                                            await FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(user!.uid)
                                                .set({
                                              'uid': user!.uid,
                                              'username': name,
                                              'location': location,
                                              'email': email,
                                              'password': password,
                                              'status': 'Unavailable'
                                            });
                                          });
                                        }
                                      }
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
