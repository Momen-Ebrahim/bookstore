import 'dart:io';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/views/user_nav_bar_m.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/custom_text_form_field.dart';
import 'package:bookstore/widgets/top_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookstore/cubits/update_user_profile/update_user_profile_cubit.dart';
import 'package:bookstore/constants.dart';
import 'package:http/http.dart' as http;

class EditView extends StatefulWidget {
  const EditView({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  _EditViewState createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  File? _pickedImage;
  bool isInit = false;

  Future<void> _uploadImage(File imageFile) async {
    final url = Uri.parse('https://book-store-api-mu.vercel.app/User/Edit');
    final request = http.MultipartRequest('PUT', url);

    request.files.add(await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
    ));
    request.headers.addAll(
        {'Authorization': 'Bearer ${CacheNetwork.getCacheData(key: 'token')}'});

    final response = await request.send();

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Image uploaded successfully!');
      }
    } else {
      if (kDebugMode) {
        print('Image upload failed with status: ${response.statusCode}');
      }
    }
  }

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        isInit = true;
      });
    }
  }

  void _clearTextFields() {
    context.read<UpdateUserProfileCubit>().editFirstName.clear();
    context.read<UpdateUserProfileCubit>().editLastName.clear();
    context.read<UpdateUserProfileCubit>().editUserName.clear();
    context.read<UpdateUserProfileCubit>().editEmail.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: context.read<UpdateUserProfileCubit>().editFormKey,
          child: Center(
            child: ListView(
              children: [
                topBar(S.of(context).UpdateInformation, null),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  S.of(context).Pleasefillyour,
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: isInit && _pickedImage != null
                                  ? FileImage(_pickedImage!)
                                  : NetworkImage(widget.image) as ImageProvider,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          right: 12,
                          child: IconButton(
                            onPressed: _pickImage,
                            icon: const Icon(
                              Icons.add_a_photo,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: context
                            .read<UpdateUserProfileCubit>()
                            .editFirstName,
                        obscureText: false,
                        hintText: S.of(context).FirstName,
                        prefixIcon: const Icon(FontAwesomeIcons.user),
                        onSaved: (value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller:
                            context.read<UpdateUserProfileCubit>().editLastName,
                        obscureText: false,
                        hintText: S.of(context).LastName,
                        prefixIcon: const Icon(FontAwesomeIcons.user),
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller:
                      context.read<UpdateUserProfileCubit>().editUserName,
                  obscureText: false,
                  hintText: S.of(context).UserName,
                  prefixIcon: const Icon(FontAwesomeIcons.user),
                  onSaved: (value) {},
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                BlocConsumer<UpdateUserProfileCubit, UpdateUserProfileState>(
                  listener: (context, state) {
                    if (state is UpdateUserProfileSuccess) {
                      _clearTextFields();
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserNavigationBar(),
                          ),
                        );
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdateUserProfileInitial ||
                        state is UpdateUserProfileLoading) {
                      return state is UpdateUserProfileLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            )
                          : CustomButton(
                              color: Colors.black,
                              title: S.of(context).Update,
                              onTap: () async {
                                if (_pickedImage != null) {
                                  await _uploadImage(_pickedImage!).then(
                                      (value) => context
                                          .read<UpdateUserProfileCubit>()
                                          .updateUserProfile());
                                } else {
                                  context
                                      .read<UpdateUserProfileCubit>()
                                      .updateUserProfile();
                                }
                              });
                    } else {
                      return CustomButton(
                        color: Colors.black,
                        title: S.of(context).Update,
                        onTap: () async {
                          if (_pickedImage != null) {
                            await _uploadImage(_pickedImage!).then((value) =>
                                context
                                    .read<UpdateUserProfileCubit>()
                                    .updateUserProfile());
                          } else {
                            context
                                .read<UpdateUserProfileCubit>()
                                .updateUserProfile();
                          }
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
