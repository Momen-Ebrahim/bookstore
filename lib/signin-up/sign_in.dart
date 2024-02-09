import 'package:bookstore/signin-up/sign_up_view.dart';
import 'package:bookstore/views/user_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final formKey = GlobalKey<FormState>();
  var _enterEmail = "";
  var _enteredPass = "";
  bool _isVisible = true;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void _handleSignIn() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: _enterEmail, password: _enteredPass);

      Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const UserNavBar(),
          ));

      if (kDebugMode) {
        print('user: $userCredential');
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Invalid email or password'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                )
              ],
            );
          });
      if (kDebugMode) {
        print('Error Log in: $e');
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
        print('user signed in');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const UserNavBar()));
      }
    } catch (e) {
      print('error: $e');
    }
  }

  void _saveItem() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _handleSignIn();
      print(_enterEmail);
      print(_enteredPass);
      // final data = SignInModel(email: _enterEmail, password: _enteredPass);
      // signindata.add(data);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: Center(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 200,
              ),
            ),
            const Center(
              child: Text(
                "Log in",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value!)) {
                  return "Please enter a valid email address";
                } else if (value.isEmpty) {
                  return "Email should not be empty";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                _enterEmail = value!;
              },
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: const Icon(Icons.email),
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
            const SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password should not be empty";
                }
                return null;
              },
              onSaved: (value) {
                _enteredPass = value!;
              },
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _isVisible = !_isVisible),
                  icon: _isVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
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
              obscureText: _isVisible,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    signinwuthgoogle();
                  },
                  icon: const Icon(FontAwesomeIcons.google),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.facebook),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  _saveItem();
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SIGN IN OR ?  ',
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const SignUpView(),
                        ));
                  },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
