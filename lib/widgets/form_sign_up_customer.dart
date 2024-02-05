// ignore_for_file: use_build_context_synchronously

import 'package:bookstore/homescreen.dart';
import 'package:bookstore/signin-up/sign_in.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormSignUpCustomer extends StatefulWidget {
  const FormSignUpCustomer({Key? key});

  @override
  _FormSignUpCustomerState createState() => _FormSignUpCustomerState();
}

class _FormSignUpCustomerState extends State<FormSignUpCustomer> {
  final formKey = GlobalKey<FormState>();
  var firstName;
  var lastName;
  var email;
  var password;
  var isObscure = true;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void _handleSignUp() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Homepage()));
      if (kDebugMode) {
        print("User Created: ${userCredential.user!.uid}");
      }
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
    }
  }

  void _saveItem() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // print(firstName);
      // print(lastName);
      // print(email);
      // print(password);
      _handleSignUp();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.4,
                child: TextFormField(
                  cursorColor: Colors.black,
                  autovalidateMode: autovalidateMode,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your first name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    firstName = value!;
                  },
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xff2F3C50),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xff2F3C50),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xff2F3C50),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: width * 0.4,
                  child: TextFormField(
                    autovalidateMode: autovalidateMode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your last name';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      lastName = value!;
                    },
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xff2F3C50),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xff2F3C50),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xff2F3C50),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: autovalidateMode,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (!RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                  .hasMatch(value!)) {
                return "Please enter a valid email address";
              }

              return null;
            },
            onSaved: (value) {
              email = value!;
            },
            decoration: InputDecoration(
              hintText: 'email',
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xff2F3C50),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xff2F3C50),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xff2F3C50),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: autovalidateMode,
            validator: (value) {
              if (value!.isEmpty) {
                return "Password should not be empty";
              } else if (!RegExp((r'^(?=.*?[A-Z])')).hasMatch(value)) {
                return "Password should have an uppercase letter";
              } else if (!RegExp((r'^(?=.*?[a-z])')).hasMatch(value)) {
                return "Password should have an lowercase letter";
              } else if (!RegExp((r'^(?=.*?[0-9])')).hasMatch(value)) {
                return "Password should have an number";
              } else if (value.length < 6) {
                return "Password should  be more than 6";
              }
              return null;
            },
            onSaved: (value) {
              password = value!;
            },
            obscureText: isObscure,
            decoration: InputDecoration(
              suffixIcon: isObscure
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: const Icon(Icons.visibility_off))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye)),
              hintText: 'Password',
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xff2F3C50),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xff2F3C50),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xff2F3C50),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(FontAwesomeIcons.google)),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.facebook),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onTap: _saveItem,
            color: Colors.black,
            title: 'SIGN UP',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'REGISTER OR ? ',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Signin(),
                      ));
                },
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
