import 'package:bookstore/views/user_view/list_settings.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * (20 / 800),
              left: 20,
              right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/accountpic.png',
                  height: 120,
                  width: 120,
                ),
              ),
              const Text(
                'Edit',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (5 / 800),
              ),
              const Text(
                'Mustafa Moamen',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (3 / 800),
              ),
              const Text(
                'example@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 40,
              ),
              const ListSettings(
                title: 'My Books',
                iconData: (FontAwesomeIcons.book),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (10 / 800),
              ),
              const ListSettings(
                title: 'Favorite',
                iconData: (Icons.favorite),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (10 / 800),
              ),
              const ListSettings(
                title: 'About Us',
                iconData: (Icons.info),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (40 / 800),
              ),
              const CustomButton(color: Colors.red, title: 'Log Out')
            ],
          ),
        ),
      ),
    );
  }
}
