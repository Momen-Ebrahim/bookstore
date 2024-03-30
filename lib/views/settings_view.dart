import 'package:bookstore/cubits/user_cubit/user_cubit.dart';
import 'package:bookstore/views/list_settings.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/top_bar.dart';
import 'package:bookstore/widgets/user_owns_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: topBar(
            'Account Settings',
            null,
          ),
          body: state is GetUserLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is GetUserSuccess
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * (20 / 800),
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 160,
                              height: 160,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      // image: NetworkImage(state.user.profilePic),
                                      image: AssetImage(
                                          'assets/images/accountpic.png'))),
                            ),
                            const Text(
                              'Edit',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (5 / 800),
                            ),
                            Text(
                              state.user.name,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (3 / 800),
                            ),
                            Text(
                              state.user.email,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 40,
                            ),
                            ListSettings(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const UserBooks(),
                                  ),
                                );
                              },
                              title: 'My Books',
                              iconData: (FontAwesomeIcons.book),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (10 / 800),
                            ),
                            const ListSettings(
                              title: 'Favorite',
                              iconData: (Icons.favorite),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (10 / 800),
                            ),
                            const ListSettings(
                              title: 'About Us',
                              iconData: (Icons.info),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (40 / 800),
                            ),
                            const CustomButton(
                                color: Colors.red, title: 'Log Out')
                          ],
                        ),
                      ),
                    )
                  : Container(),
        );
      },
    );
  }
}
