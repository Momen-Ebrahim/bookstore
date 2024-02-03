import 'package:bookstore/constants.dart';
import 'package:bookstore/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:bookstore/widgets/custom_switch_button.dart';
import 'package:bookstore/widgets/form_sign_up_admin.dart';
import 'package:bookstore/widgets/form_sign_up_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          SizedBox(
            height: height * (20 / 800),
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: height * (20 / 800),
          ),
          const Center(
            child: Text(
              'SIGN UP',
              style: TextStyle(fontSize: 28),
            ),
          ),
          SizedBox(
            height: height * (30 / 800),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  if (state is SignUpUser || state is SignUpInitial) {
                    return CustomSwitchButton(
                      onTap: () {
                        BlocProvider.of<SignUpCubit>(context).signUpUser();
                      },
                      color: Colors.grey,
                      title: 'Cutomer',
                    );
                  } else {
                    return CustomSwitchButton(
                      onTap: () {
                        BlocProvider.of<SignUpCubit>(context).signUpUser();
                      },
                      color: Colors.white,
                      title: 'Cutomer',
                    );
                  }
                },
              ),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  if (state is SignUpAdmin) {
                    return CustomSwitchButton(
                      onTap: () {
                        BlocProvider.of<SignUpCubit>(context).signUpAdmin();
                      },
                      color: Colors.grey,
                      title: 'Admin',
                    );
                  } else {
                    return CustomSwitchButton(
                      onTap: () {
                        BlocProvider.of<SignUpCubit>(context).signUpAdmin();
                      },
                      color: Colors.white,
                      title: 'Admin',
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              if (state is SignUpInitial) {
                return const FormSignUpCustomer();
              } else if (state is SignUpAdmin) {
                return const FormSignUpAdmin();
              } else {
                return const FormSignUpCustomer();
              }
            },
          ),
        ],
      ),
    );
  }
}
