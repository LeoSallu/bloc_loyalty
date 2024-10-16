import 'package:bloc_loyalty/card/widgets/card.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  Future<void> refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: refreshData,
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.transparent,
                pinned: true,
                floating: false,
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  background: FidelityCard(),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.card_giftcard_sharp,
                                ),
                                SizedBox(width: 25),
                                Text('Tipo Transazione'),
                              ],
                            ),
                          ),
                          subtitle: Text(
                            '${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year.toString().substring(2)}',
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                  childCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
