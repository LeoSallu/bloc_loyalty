import 'package:bloc_loyalty/card/view/card_view.dart';
import 'package:bloc_loyalty/flyer/view/flyer_view.dart';
import 'package:bloc_loyalty/gifts/view/gifts_view.dart';
import 'package:bloc_loyalty/home/cubit/home_cubit.dart';
import 'package:bloc_loyalty/profile/view/profile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeTab selectedTab = HomeTab.card;

  void onSelectTab(HomeTab tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageForTab(selectedTab),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        height: 95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.card,
              label: 'Carta',
              icon: Icons.card_membership,
              active: selectedTab == HomeTab.card,
              onSelect: () => onSelectTab(HomeTab.card),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.flyer,
              label: 'Volantino',
              icon: Icons.newspaper_sharp,
              active: selectedTab == HomeTab.flyer,
              onSelect: () => onSelectTab(HomeTab.flyer),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.gifts,
              label: 'Premi',
              icon: Icons.card_giftcard_sharp,
              active: selectedTab == HomeTab.gifts,
              onSelect: () => onSelectTab(HomeTab.gifts),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.profile,
              label: 'Profilo',
              icon: Icons.person,
              active: selectedTab == HomeTab.profile,
              onSelect: () => onSelectTab(HomeTab.profile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageForTab(HomeTab tab) {
    switch (tab) {
      case HomeTab.card:
        return const CardView();
      case HomeTab.flyer:
        return const FlyerView();
      case HomeTab.gifts:
        return const GiftsView();
      case HomeTab.profile:
        return const ProfileView();
      default:
        return const CardView();
    }
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.label,
    required this.icon,
    required this.active,
    required this.onSelect,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final String label;
  final IconData icon;
  final bool active;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = (constraints.maxWidth * 0.08).clamp(8.0, 15.0);

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(
                  active
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                ),
              ),
              onPressed: onSelect,
              icon: Icon(
                icon,
                size: 25,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: active
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        );
      },
    );
  }
}
