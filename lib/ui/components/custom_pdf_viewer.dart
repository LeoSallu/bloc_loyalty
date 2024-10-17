import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class CustomPdfViewer extends StatelessWidget {
  const CustomPdfViewer({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.45,
      child: const PDF(
        swipeHorizontal: true,
      ).cachedFromUrl(
        url,
        placeholder: (progress) => Center(
          child: CircularProgressIndicator(
            value: progress / 100,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        errorWidget: (dynamic error) => const Center(
          child:
              Text('Sembra ci sia stato qualche errore... riprova più tardi!'),
        ),
        maxAgeCacheObject: const Duration(hours: 1),
      ),
    );
  }
}
