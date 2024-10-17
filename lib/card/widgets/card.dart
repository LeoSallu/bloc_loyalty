import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class FidelityCard extends StatefulWidget {
  const FidelityCard({super.key});

  @override
  State<FidelityCard> createState() => _FidelityCardState();
}

class _FidelityCardState extends State<FidelityCard> {
  bool isFront = true;

  void turnCard() {
    setState(() => isFront = !isFront);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: _turnCardButton(context),
          ),
          isFront ? _buildFrontCard(context) : _buildBackCard(context),
        ],
      ),
    );
  }

  Column _buildFrontCard(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Leonardo Sallustio',
              style: TextStyle(
                fontSize:
                    (Theme.of(context).textTheme.bodyLarge?.fontSize ?? 14) *
                        1.5,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Totale Punti',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryFixed,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '10000',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _buildBackCard(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Numero Carta',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryFixed,
                  fontWeight: FontWeight.w500,
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: BarcodeWidget(
            barcode: Barcode.code128(),
            width: double.infinity,
            height: 110,
            data: '0401021022323',
          ),
        ),
      ],
    );
  }

  Material _turnCardButton(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
        ),
        child: InkWell(
          onTap: turnCard,
          borderRadius: BorderRadius.circular(10),
          splashColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.restart_alt,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
