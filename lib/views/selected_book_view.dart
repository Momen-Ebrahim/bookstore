import 'package:bookstore/cubits/get_books/book_id/get_books_cubit.dart';
import 'package:bookstore/widgets/SelectedBookCard2.dart';
import 'package:bookstore/widgets/selected_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectedBookView extends StatefulWidget {
  const SelectedBookView({
    super.key,
    required this.bookid,
    required this.title,
  });
  final String bookid;
  final String title;

  @override
  State<SelectedBookView> createState() => _SelectedBookViewState();
}

class _SelectedBookViewState extends State<SelectedBookView> {
  @override
  void initState() {
    super.initState();
    context.read<GetBookidCubit>().getBookid(widget.bookid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
          ),
        ),
        // title: Text(
        //   widget.title,
        //style: TextStyle(
        //fontWeight: FontWeight.w600,
        //fontSize: getResponsiveFontSize(context, fontSize: 24),
        //color: const Color(0xFF121212)),
        //),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(
                FontAwesomeIcons.heart,
                size: 24,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<GetBookidCubit, GeBooksidtate>(
                builder: (context, state) {
                  if (state is GeBookidLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (state is GetBookidSuccess) {
                    return SelectedBookCard2(
                      image: state.books.book!.image!.url.toString(),
                      title: state.books.book!.title!,
                      price: state.books.book!.price!.toString(),
                      category: state.books.book!.category!,
                      autherName: state.books.book!.author!,
                      description: state.books.book!.description!,
                      bookid: widget.bookid,
                    );
                  } else if (state is GetBookidFailure) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
