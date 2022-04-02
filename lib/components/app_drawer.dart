import 'package:flutter/material.dart';
import 'package:standup_gym_store/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF252422),
      elevation: 0,
      child: Column(
        children: [
          AppBar(
            iconTheme: const IconThemeData(
              color: Color(0xFFCCC5B9),
            ),
            elevation: 0,
            title: const Text(
              'WELCOME USER!',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFFFFFCF2),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.store,
              color: Color(0xFFCCC5B9),
            ),
            title: Text(
              'STORE',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.payment,
              color: Color(0xFFCCC5B9),
            ),
            title: Text(
              'ORDERED',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.edit,
              color: Color(0xFFCCC5B9),
            ),
            title: Text(
              'MANAGE PRODUCTS',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUCTS);
            },
          ),
        ],
      ),
    );
  }
}
