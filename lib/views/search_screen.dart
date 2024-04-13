import 'package:bookstore/widgets/card_of_cart_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, String>> books = [
    {
      'image': 'assets/images/bestDeals.png',
      'type': 'Adult Narrative',
      'title': 'book1',
      'author': 'Cristina Camerena, Lady Desatia',
      'price': '\$17.00',
    },
    {
      'image': 'assets/images/topBooks2.png',
      'title': 'book2',
      'author': 'Kate Racculia',
      'price': '\$25.00',
      'type': 'Novel',
    },
    {
      'image': 'assets/images/bestDeals.png',
      'type': 'Adult Narrative',
      'title': 'book3',
      'author': 'Cristina Camerena, Lady Desatia',
      'price': '\$17.00',
    },
    {
      'image': 'assets/images/topBooks2.png',
      'title': 'book4',
      'author': 'Kate Racculia',
      'price': '\$25.00',
      'type': 'Novel',
    },
    {
      'image': 'assets/images/bestDeals.png',
      'type': 'Adult Narrative',
      'title': 'book5',
      'author': 'Cristina Camerena, Lady Desatia',
      'price': '\$17.00',
    },
    {
      'image': 'assets/images/topBooks2.png',
      'title': 'book6',
      'author': 'Kate Racculia',
      'price': '\$25.00',
      'type': 'Novel',
    },
    {
      'image': 'assets/images/bestDeals.png',
      'type': 'Adult Narrative',
      'title': 'book7',
      'author': 'Cristina Camerena, Lady Desatia',
      'price': '\$17.00',
    },
    {
      'image': 'assets/images/topBooks2.png',
      'title': 'book8',
      'author': 'Kate Racculia',
      'price': '\$25.00',
      'type': 'Novel',
    },
  ];
  List<Map<String, String>> foundBooks = [];
  bool isfound = true;

  void searchBook(String search) {
    if (search.isEmpty) {
      setState(() {
        foundBooks = [];
        isfound = true;
      });
    } else {
      setState(() {
        foundBooks = books
            .where((element) =>
                element['title']!.toLowerCase().contains(search.toLowerCase()))
            .toList();
        if (foundBooks.isEmpty) {
          isfound = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  searchBook(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (foundBooks.isEmpty && isfound)
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .17,
                    ),
                    SvgPicture.asset(
                      'assets/images/svg/find-book-icon.svg',
                      height: 200,
                      width: 200,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Find your book',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              if (foundBooks.isEmpty && !isfound)
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .17,
                    ),
                    SvgPicture.asset(
                      'assets/images/svg/notfound.svg',
                      height: 200,
                      width: 200,
                      color: Colors.black,
                      
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'No book found ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: foundBooks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardOfCartBook(
                        image: foundBooks[index]['image']!,
                        title: foundBooks[index]['title']!,
                        author: foundBooks[index]['author']!,
                        price: foundBooks[index]['price']!,
                        type: foundBooks[index]['type']!,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
