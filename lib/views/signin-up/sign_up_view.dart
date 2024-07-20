import 'package:bookstore/constants.dart';
import 'package:bookstore/cubits/sign_up/sign_up_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/views/signin-up/sign_in_view.dart';
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
                  topBar(S.of(context).Register, null),
                  // const PickImageWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    S.of(context).Pleasefillyourdetailstosignup,
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
                          hintText: S.of(context).FirstName,
                          prefixIcon: const Icon(FontAwesomeIcons.user),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            if (!RegExp(r"^[a-zA-Z]{2,30}$").hasMatch(value)) {
                              return 'First name must be between 2 and 30 characters and contain only letters';
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
                          hintText: S.of(context).LastName,
                          prefixIcon: const Icon(FontAwesomeIcons.user),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            if (!RegExp(r"^[a-zA-Z]{2,30}$").hasMatch(value)) {
                              return 'Last name must be between 2 and 30 characters and contain only letters';
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
                    hintText: S.of(context).UserName,
                    prefixIcon: const Icon(FontAwesomeIcons.user),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      if (!RegExp(r"^[a-zA-Z0-9_]{3,15}$").hasMatch(value)) {
                        return 'Username must be between 3 and 15 characters and contain only letters, numbers, and underscores';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: context.read<SignUpCubit>().signUpEmail,
                    obscureText: false,
                    hintText: S.of(context).Email,
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
                    hintText: S.of(context).Password,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _isVisible = !_isVisible),
                      icon: _isVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password should not be empty";
                      } else if (!RegExp(r'^(?=.*[A-Za-z\d]).{8,}$')
                          .hasMatch(value)) {
                        return "Password must be at least 8 characters or numbers";
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
                          title: S.of(context).Register,
                          onTap: () {
                            if (context
                                    .read<SignUpCubit>()
                                    .signUpFormKey
                                    .currentState!
                                    .validate() ==
                                true) {
                              context.read<SignUpCubit>().signUp();
                            }
                          },
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).Alreadyhaveanaccount,
                        style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 16)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const Signin(),
                            ),
                          );
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
