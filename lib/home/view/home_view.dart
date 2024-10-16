import 'package:bloc_loyalty/card/view/card_view.dart';
import 'package:bloc_loyalty/flyer/view/flyer_view.dart';
import 'package:bloc_loyalty/gifts/view/gifts_view.dart';
import 'package:bloc_loyalty/home/cubit/home_cubit.dart';
import 'package:bloc_loyalty/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          CardView(),
          FlyerView(),
          GiftsView(),
          ProfileView(),
        ],
      ),
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
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.flyer,
              label: 'Volantino',
              icon: Icons.newspaper_sharp,
              active: selectedTab == HomeTab.flyer,
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.gifts,
              label: 'Premi',
              icon: Icons.card_giftcard_sharp,
              active: selectedTab == HomeTab.gifts,
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.profile,
              label: 'Profilo',
              icon: Icons.person,
              active: selectedTab == HomeTab.profile,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.label,
    required this.icon,
    required this.active,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final String label;
  final IconData icon;
  final bool active;

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
              onPressed: () => context.read<HomeCubit>().setTab(value),
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
