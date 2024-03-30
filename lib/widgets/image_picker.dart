import 'dart:io';

import 'package:bookstore/cubits/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            context.read<UserCubit>().profilePic == null
                ? Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/accountpic.png'),
                      ),
                    ),
                  )
                : Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: FileImage(
                          File(
                            context.read<UserCubit>().profilePic!.path,
                          ),
                        ),
                      ),
                    ),
                  ),
            // : Center(
            //     child: CircleAvatar(
            //     radius: 80,
            //     child: Image.file(
            //       File(context.read<UserCubit>().profilePic!.path),
            //       height: 120,
            //       width: 120,
            //     ),
            //   )),
            GestureDetector(
              onTap: () {
                ImagePicker().pickImage(source: ImageSource.gallery).then(
                      (value) =>
                          context.read<UserCubit>().uploadProfilePic(value!),
                    );
              },
              child: const Text(
                'upload picture',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
        //  SizedBox(
        //   width: 130,
        //   height: 130,
        //   child: context.read<UserCubit>().profilePic == null
        //       ? CircleAvatar(
        //           backgroundColor: Colors.grey.shade200,
        //           backgroundImage:
        //               const AssetImage('assets/images/accountpic.png'),
        //           child: Stack(
        //             children: [
        //               Positioned(
        //                 bottom: 5,
        //                 right: 120,
        //                 child: GestureDetector(
        //                   onTap: () async {},
        //                   child: Container(
        //                     height: 50,
        //                     width: 50,
        //                     decoration: BoxDecoration(
        //                       color: Colors.blue.shade400,
        //                       border: Border.all(color: Colors.white, width: 3),
        //                       borderRadius: BorderRadius.circular(25),
        //                     ),
        //                     child: GestureDetector(
        //                       onTap: () {
        //                         ImagePicker()
        //                             .pickImage(source: ImageSource.gallery)
        //                             .then(
        //                               (value) => context
        //                                   .read<UserCubit>()
        //                                   .uploadProfilePic(value!),
        //                             );
        //                       },
        //                       child: const Icon(
        //                         Icons.camera_alt_sharp,
        //                         color: Colors.white,
        //                         size: 25,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //       : CircleAvatar(
        //           backgroundImage: FileImage(
        //             File(context.read<UserCubit>().profilePic!.path),
        //           ),
        //         ),
        // );
      },
    );
  }
}
