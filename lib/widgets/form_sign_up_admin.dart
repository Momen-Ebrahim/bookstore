import 'package:bookstore/constants.dart';
import 'package:bookstore/signin-up/sign_in.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormSignUpAdmin extends StatefulWidget {
  const FormSignUpAdmin({super.key});

  @override
  State<FormSignUpAdmin> createState() => _FormSignUpAdminState();
}

class _FormSignUpAdminState extends State<FormSignUpAdmin> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isObscure = true;
  String? firstName, lastName, nickName, email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
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
              Container(
                width: width * 0.4,
                child: CustomTextFormField(
                  autovalidateMode: autovalidateMode,
                  hintText: 'First Name',
                  onSaved: (value) {
                    firstName = value;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'please enter your first name';
                    } else {
                      return '';
                    }
                  },
                ),
              ),
              Container(
                width: width * 0.4,
                child: CustomTextFormField(
                  autovalidateMode: autovalidateMode,
                  hintText: 'Last Name',
                  onSaved: (value) {
                    lastName = value;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
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
            hintText: 'Nick Name',
            onSaved: (value) {
              nickName = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'please enter your nick name';
              } else {
                return '';
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            autovalidateMode: autovalidateMode,
            hintText: 'email',
            onSaved: (value) {
              email = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'please enter your email';
              }
              return '';
            },
          ),
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
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    icon: const Icon(Icons.visibility_off))
                : IconButton(
                    onPressed: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove_red_eye)),
            onSaved: (value) {
              firstName = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'please enter your password';
              } else {
                return '';
              }
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
              onTap: () {
                if (formKey.currentState!.validate()) {
                  // var signUpModel = SignUpModel(
                  //     firstName: firstName!,
                  //     lastName: lastName!,
                  //     nickName: nickName!,
                  //     email: email!,
                  //     password: password!);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              color: Colors.black,
              title: 'SIGN UP'),
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
