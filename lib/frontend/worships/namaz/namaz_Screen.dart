import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdf_viewer extends StatefulWidget {
  String name;
  String url;
  bool isAsset;
  pdf_viewer({
    super.key,
    required this.name,
    required this.url,
    required this.isAsset,
  });

  @override
  State<pdf_viewer> createState() => _pdf_viewerState();
}

class _pdf_viewerState extends State<pdf_viewer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: kprimaryColor,
          ),
          title: Center(
            child: Text(
              widget.name,
              style: TextStyle(
                color: kprimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          actions: [
            Container(
              height: 10,
              width: 60,
            ),
          ],
        ),
        body: widget.isAsset
            ? SfPdfViewer.asset(
                widget.url,
                onDocumentLoadFailed: (d) {
                  Fluttertoast.showToast(msg: d.error);
                },
              )
            : SfPdfViewer.network(
                widget.url,
                onDocumentLoadFailed: (d) {
                  Fluttertoast.showToast(msg: d.error);
                },
              ),
      ),
    );
  }
}
