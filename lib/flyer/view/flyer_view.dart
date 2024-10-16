import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class FlyerView extends StatelessWidget {
  const FlyerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Volantino del mese',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 30,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      body: const _Flyer(
        url: 'url',
      ),
    );
  }
}

class _Flyer extends StatelessWidget {
  const _Flyer({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3,
      child: const PDF(swipeHorizontal: true).cachedFromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
        maxAgeCacheObject: const Duration(seconds: 1),
      ),
    );
  }
}
