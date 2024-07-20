import 'dart:ui';
import 'package:bookstore/constants.dart';
import 'package:bookstore/cubits/get_user_info/get_user_info_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/views/changelang.dart';
import 'package:bookstore/views/edit_view.dart';
import 'package:bookstore/views/list_settings.dart';
import 'package:bookstore/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
        S.of(context).AccountSettings,
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
          builder: (context, state) {
        if (state is GetUserInfoLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        } else if (state is GetUserInfoSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Seattings(
              firstname: state.response.findUser!.firstname!,
              lastname: state.response.findUser!.lastname!,
              email: state.response.findUser!.email!,
              image: state.response.findUser!.image!.url ?? "",
            ),
          );
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      }),
    );
  }
}

class Seattings extends StatelessWidget {
  const Seattings({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.image,
  });
  final String firstname;
  final String lastname;
  final String email;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(image),
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    firstname,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    lastname,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text(
              email,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * (5 / 800),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => EditView(image: image),
                ),
              ),
              child: Text(
                S.of(context).Edit,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 40,
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.language,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text(
                S.of(context).language,
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: LanguageSelection(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * (10 / 800),
            ),
            ListSettings(
              title: S.of(context).AboutUs,
              iconData: (Icons.info),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * (40 / 800),
            ),
          ],
        ),
      ),
    );
  }
}
