import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class OpenBook extends StatefulWidget {
  const OpenBook({super.key, required this.bookurl});
  final String bookurl;

  @override
  State<OpenBook> createState() => _OpenBookState();
}

class _OpenBookState extends State<OpenBook> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {
                  _pdfViewerKey.currentState!.openBookmarkView();
                },
                icon: const Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                ))
          ],
          title: const Text('Book Name', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SfPdfViewer.network(
            widget.bookurl,
            controller: _pdfViewerController,
            key: _pdfViewerKey,
            pageSpacing: 10.0,
          ),
        ),
      ),
    );
  }
}
