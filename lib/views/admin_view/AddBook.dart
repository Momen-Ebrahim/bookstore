import 'dart:io';
import 'package:bookstore/models/category.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/custom_input_decoration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _CartState();
}

final _formKey = GlobalKey<FormState>();
File? _image;

String _bookName = '';
String _authorName = '';
String _price = '';
String _description = '';
String _category = '';

class _CartState extends State<AddBook> {
  Future _pickimg() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(img!.path);
    });
  }

  void savebook() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (kDebugMode) {
        print(_bookName);
        print(_authorName);
        print(_price);
        print(_description);
        print(_category);
        print(_image);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Book Name',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (value) {
                  _bookName = value!;
                },
                decoration: inputdec('Enter Book Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Author Name',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (value) {
                  _authorName = value!;
                },
                decoration: inputdec('Enter Author Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Price',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (value) {
                  _price = value!;
                },
                decoration: inputdec('Enter Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Description',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  onSaved: (value) {
                    _description = value!;
                  },
                  decoration: inputdec('Enter Description')),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Category',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525)),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                items: [
                  for (var chategorie in Categories.values)
                    DropdownMenuItem(
                        value: chategorie.name,
                        child: Text(
                          chategorie.name,
                        ))
                ].toList(),
                onChanged: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                onSaved: (value) {
                  _category = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: inputdec('Select Category'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Image',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      color: Colors.black,
                      title: 'Pick Image',
                      onTap: () {
                        _pickimg();
                      },
                    ),
                  ),
                  _image != null
                      ? Expanded(
                          child: Image.file(
                            _image!,
                            height: 100,
                            width: 100,
                          ),
                        )
                      : const SizedBox(
                          height: 100,
                          width: 100,
                          child: Center(
                            child: Text(
                              'No Image',
                            ),
                          )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                color: Colors.black,
                title: 'Add Book',
                onTap: () {
                  savebook();
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
