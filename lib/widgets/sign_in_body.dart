import 'package:bookstore/constants.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  bool isObscure = true;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 250,
              height: 200,
            ),
            const Center(
              child: Text(
                'LOG IN',
                style: TextStyle(fontSize: 28),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextFormField(
              autovalidateMode: autovalidateMode,
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email),
              onSaved: (value) {
                email = value;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'please enter your email';
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
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock),
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
                password = value;
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
                    onPressed: () {},
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
            CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // var signInModel =
                    //     SignInModel(email: email!, password: password!);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                color: kPrimerycolor,
                title: 'SIGN IN'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SIGN IN OR   ',
                  style: TextStyle(fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute<void>(
                    //       builder: (BuildContext context) => const SignUpView(),
                    //     ));
                  },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(fontSize: 18, color: kPrimerycolor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
