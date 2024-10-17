import 'package:bloc_loyalty/ui/components/custom_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlyerView extends StatelessWidget {
  const FlyerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height / 8,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Volantino del mese',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      body: const CustomPdfViewer(url: 'https://pdfobject.com/pdf/sample.pdf'),
    );
  }
}
