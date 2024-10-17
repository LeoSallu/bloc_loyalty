import 'package:bloc_loyalty/authentication/authentication.dart';
import 'package:bloc_loyalty/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      context.read<AuthenticationBloc>().add(AuthenticationLogoutPressed());
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 6,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(70, 30),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'CIAO 👋🏻',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'NOME E COGNOME',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.009),
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileLink(
                context,
                Icons.person,
                'Dati Account',
                true,
                () {},
              ),
              _buildProfileLink(
                context,
                Icons.emoji_people,
                'Dati Personali',
                true,
                () {},
              ),
              _buildProfileLink(
                context,
                Icons.settings,
                'Opzioni',
                true,
                () {},
              ),
              _buildProfileLink(
                context,
                Icons.logout,
                'Logout',
                false,
                () => logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildProfileLink(
    BuildContext context,
    IconData icon,
    String label,
    bool chevronVisible,
    void Function() onTap,
  ) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ),
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: Theme.of(context).textTheme.displaySmall?.fontSize,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
              chevronVisible
                  ? Icon(
                      Icons.chevron_right,
                      size: Theme.of(context).textTheme.displaySmall?.fontSize,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
