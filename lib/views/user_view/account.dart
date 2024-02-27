import 'package:bookstore/widgets/account_details.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Account extends StatefulWidget {
  const Account({super.key, required this.onSignOut});
  final VoidCallback onSignOut;
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String? enmail = auth.currentUser!.email;
    String? name = auth.currentUser!.displayName;
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: hight * (20 / 800), left: 20, right: 20),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/accountpic.png',
                  height: 120,
                  width: 120,
                ),
              ),
              SizedBox(
                height: hight * (20 / 800),
              ),
              AccountDetails(title: 'Name', value: name ?? 'Ali Ahmed'),
              SizedBox(
                height: hight * (20 / 800),
              ),
              AccountDetails(title: 'Email', value: enmail!),
              SizedBox(
                height: hight * (20 / 800),
              ),
              const AccountDetails(title: 'password', value: '*********'),
              SizedBox(
                height: hight * (40 / 800),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: width * (150 / 375),
                      child: const CustomButton(
                          color: Colors.black, title: 'Edit')),
                  InkWell(
                    onTap: () {
                      if (FirebaseAuth.instance.currentUser != null) {
                        auth.signOut();
                      }

                      if (GoogleSignIn().currentUser != null) {
                        GoogleSignIn().signOut();
                      }
                      widget.onSignOut();
                      print('Sign Out');
                    },
                    child: Container(
                      height: 50,
                      width: width * (150 / 375),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: const Border(
                          top: BorderSide(color: Colors.black, width: 2),
                          bottom: BorderSide(color: Colors.black, width: 2),
                          left: BorderSide(color: Colors.black, width: 2),
                          right: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
