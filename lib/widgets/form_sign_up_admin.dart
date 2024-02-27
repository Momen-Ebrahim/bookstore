import 'package:bookstore/signin-up/sign_in.dart';
import 'package:bookstore/views/admin_view/admin_nav_bar.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/custom_input_decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FormSignUpAdmin extends StatefulWidget {
  const FormSignUpAdmin({super.key});

  @override
  State<FormSignUpAdmin> createState() => _FormSignUpAdminState();
}

class _FormSignUpAdminState extends State<FormSignUpAdmin> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isObscure = true;
  var firstName;
  var lastName;
  var email;
  var password;
  var nickName;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void _handleSignUp() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const AdminNavigationBar()));
      if (kDebugMode) {
        print("User Created: ${userCredential.user!.uid}");
      }
    } catch (e) {
      if (kDebugMode) {
        print('errorssssssssss: $e');
      }
    }
  }

  void signinwuthgoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await auth.signInWithCredential(authCredential);
        if (kDebugMode) {
          print('user signed in');
        }
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const AdminNavigationBar()));
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
      _handleSignUp();
      if (kDebugMode) {
        print(firstName);
        print(lastName);
        print(nickName);
        print(email);
        print(password);
      }
    }
  }

  @override
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
                  decoration: inputdec('First Name'),
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
                    decoration: inputdec('Last Name'),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: autovalidateMode,
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter your Nick name';
              }

              return null;
            },
            onSaved: (value) {
              nickName = value!;
            },
            decoration: inputdec('Nick Name'),
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
            decoration: inputdec('Email'),
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
            decoration: inputdec('Password').copyWith(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
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
                  onPressed: () {
                    signinwuthgoogle();
                  },
                  icon: const Icon(FontAwesomeIcons.google)),
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
          CustomButton(onTap: _saveItem, color: Colors.black, title: 'SIGN UP'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'REGISTER OR ? ',
                style: TextStyle(fontSize: 16),
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
