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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CIAO 👋🏻',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Leonardo Sallustio'.toUpperCase(),
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
                () => _buildModal(
                  context,
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.45,
                    child: const Center(
                      child: Text('Dati Account'),
                    ),
                  ),
                ),
              ),
              _buildProfileLink(
                context,
                Icons.emoji_people,
                'Dati Personali',
                true,
                () => _buildModal(
                  context,
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.45,
                    child: const Center(
                      child: Text('Dati Personali'),
                    ),
                  ),
                ),
              ),
              _buildProfileLink(
                context,
                Icons.settings,
                'Opzioni',
                true,
                () => _buildModal(
                  context,
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.45,
                    child: const Center(
                      child: Text('Opzioni'),
                    ),
                  ),
                ),
              ),
              _buildProfileLink(
                context,
                Icons.logout,
                'Logout',
                false,
                () => _buildModal(
                  context,
                  _buildLogoutModal(context, logout),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _buildModal(context, Widget page) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.elliptical(70, 30),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return page;
      },
    );
  }

  SizedBox _buildLogoutModal(context, Function logout) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sei Sicuro ?',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Annulla'),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                ),
                onPressed: () => logout(),
                child: Text(
                  'Prosegui',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )
            ],
          )
        ],
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
