import 'package:bookstore/constants.dart';
import 'package:bookstore/cubits/sign_up/sign_up_cubit.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/custom_text_form_field.dart';
import 'package:bookstore/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.toString()),
            ),
          );
          Navigator.pop(context);
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: context.read<SignUpCubit>().signUpFormKey,
            child: Center(
              child: ListView(
                children: [
                  topBar('Register', null),
                  // const PickImageWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    'Please fill your details to signup.',
                    style: TextStyle(
                        fontSize: getResponsiveFontSize(context, fontSize: 18)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller:
                              context.read<SignUpCubit>().signUpFirstName,
                          obscureText: false,
                          hintText: 'First Name',
                          prefixIcon: const Icon(FontAwesomeIcons.user),
                          validator: (value) {
                            if (!RegExp(
                                    r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value!)) {
                              return "Please enter your name";
                            } else if (value.isEmpty) {
                              return "First Name should not be empty";
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller:
                              context.read<SignUpCubit>().signUpLastName,
                          obscureText: false,
                          hintText: 'Last Name',
                          prefixIcon: const Icon(FontAwesomeIcons.user),
                          validator: (value) {
                            if (!RegExp(
                                    r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value!)) {
                              return "Please enter your name";
                            } else if (value.isEmpty) {
                              return "Last Name should not be empty";
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  CustomTextFormField(
                    controller: context.read<SignUpCubit>().signUpUserName,
                    obscureText: false,
                    hintText: 'Username',
                    prefixIcon: const Icon(FontAwesomeIcons.user),
                    validator: (value) {
                      if (!RegExp(
                              r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value!)) {
                        return "Please enter your name";
                      } else if (value.isEmpty) {
                        return "Username should not be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: context.read<SignUpCubit>().signUpEmail,
                    obscureText: false,
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    validator: (value) {
                      if (!RegExp(
                              r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value!)) {
                        return "Please enter a valid email address";
                      } else if (value.isEmpty) {
                        return "Email should not be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: context.read<SignUpCubit>().signUpPassword,
                    obscureText: _isVisible,
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _isVisible = !_isVisible),
                      icon: _isVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password should not be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  const SizedBox(height: 20),
                  state is SignUpLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : CustomButton(
                          color: Colors.black,
                          title: 'Register',
                          onTap: () {
                            context.read<SignUpCubit>().signUp();
                            // if (formKey.currentState!.validate()) {

                            // }
                          },
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member ? ',
                        style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 16)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'SignIn',
                          style: TextStyle(
                              fontSize:
                                  getResponsiveFontSize(context, fontSize: 18),
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
