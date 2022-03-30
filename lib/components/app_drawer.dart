import 'package:flutter/material.dart';
import 'package:standup_gym_store/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'WELCOME USER!',
              style: TextStyle(fontSize: 30),
            ),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.store,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: const Text(
              'STORE',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: const Text(
              'ORDERED',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
            },
          ),
        ],
      ),
    );
  }
}
