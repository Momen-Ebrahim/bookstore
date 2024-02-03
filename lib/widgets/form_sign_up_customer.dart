import 'package:bookstore/homescreen.dart';
import 'package:bookstore/signin-up/sign_in.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/custom_text_form_field.dart';
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
  void _saveItem() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // final data = SignInModel(email: _enterEmail, password: _enteredPass);
      // signindata.add(data);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Homepage()));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.4,
                child: CustomTextFormField(
                  autovalidateMode: autovalidateMode,
                  hintText: 'First Name',
                  onSaved: (value) {
                    firstName = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your first name';
                    }
                    return '';
                  },
                ),
              ),
              Container(
                width: width * 0.4,
                child: CustomTextFormField(
                  autovalidateMode: autovalidateMode,
                  hintText: 'Last Name',
                  onSaved: (value) {
                    lastName = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your last name';
                    } else {
                      return '';
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
              autovalidateMode: autovalidateMode,
              hintText: 'email',
              onSaved: (value) {
                email = value!;
              },
              validator: (value) {
                if (!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value!)) {
                  return "Please enter a valid email address";
                }
                return '';
              }),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            autovalidateMode: autovalidateMode,
            hintText: 'Password',
            obscureText: isObscure,
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
            onSaved: (value) {
              password = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Password should not be empty";
              } else if (!RegExp((r'^(?=.*?[A-Z])')).hasMatch(value!)) {
                return "Password should have an uppercase letter";
              } else if (!RegExp((r'^(?=.*?[a-z])')).hasMatch(value!)) {
                return "Password should have an lowercase letter";
              } else if (!RegExp((r'^(?=.*?[0-9])')).hasMatch(value!)) {
                return "Password should have an number";
              } else if (value.length < 6) {
                return "Password should  be more than 6";
              }
              return '';
            },
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
