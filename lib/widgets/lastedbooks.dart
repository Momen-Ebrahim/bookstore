
import 'package:bookstore/cubits/get_books/get_newarrival_books/get_books_cubit.dart';
import 'package:bookstore/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooknewarrivalCardListView extends StatefulWidget {
  const BooknewarrivalCardListView({super.key});

  // static const bookCardItems = [
  //   BookCardModels('assets/images/topBooks1.png',
  //       category: 'classics',
  //       title: 'The Picture of Dorian\n Gray',
  //       autherName: 'Oscar Wilde',
  //       price: r'$25.00'),
  //   BookCardModels('assets/images/topBooks2.png',
  //       category: 'classics',
  //       title: 'The Picture of Dorian\n Gray',
  //       autherName: 'Oscar Wilde',
  //       price: r'$25.00'),
  //   BookCardModels('assets/images/bestDeals.png',
  //       category: 'classics',
  //       title: 'The Picture of Dorian\n Gray',
  //       autherName: 'Oscar Wilde',
  //       price: r'$25.00'),
  //   BookCardModels('assets/images/bestDeals1.png',
  //       category: 'classics',
  //       title: 'The Picture of Dorian\n Gray',
  //       autherName: 'Oscar Wilde',
  //       price: r'$25.00'),

  //   // '',
  //   // ',
  //   // // 'assets/images/bestDeals1.png'
  // ];

  @override
  State<BooknewarrivalCardListView> createState() => _BooknewarrivalCardListViewState();
}

class _BooknewarrivalCardListViewState extends State<BooknewarrivalCardListView> {
  List<dynamic> books = [];

  @override
  void initState() {
    super.initState();
    // fetchBooks();
    context.read<GetnewarrivalBooksCubit>().getnewarrivalbooks();
  }

  // Future<void> fetchBooks() async {
  //   final response =
  //       await http.get(Uri.parse('https://book-store-api-mu.vercel.app/Books'));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       books = json.decode(response.body);
  //     });
  //   } else {
  //     throw Exception('Failed to load books');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetnewarrivalBooksCubit, GearrivalBooksState>(
      builder: (context, state) {
        if (state is GetnewarrivalBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        } else if (state is GetnewarrivalBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.46,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.book!.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: BookCard(
                    image: state.books.book![index].image!.url.toString(),
                    title: state.books.book![index].title!,
                    price: state.books.book![index].price!,
                    category: state.books.book![index].category!,
                    autherName: state.books.book![index].author!,
                    description: state.books.book![index].description!,
                  ),
                );
              }),
            ),
          );
        } else if (state is GetnewarrivalBooksFailure) {
          return const Center(
            child: Text('Failed to load books: '),
          );
        }
        return const SizedBox(
          child: Text('Failed to load books'),
        );
      },
    );
    // return Row(
    //   children: bookCardImage
    //       .map((e) => const Expanded(
    //             child: Padding(
    //               padding: EdgeInsets.only(left: 12),
    //               child: BookCardd(
    //                 image: 'assets/images/topBooks2.png',
    //               ),
    //             ),
    //           ))
    //       .toList(),
    // );
  }
}
