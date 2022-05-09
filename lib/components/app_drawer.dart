import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            title: Text(
              'BEM VINDO USUÁRIO(A)!',
              style: GoogleFonts.titilliumWeb(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFCF2),
                ),
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
              'LOJA',
              style: GoogleFonts.titilliumWeb(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.AUTH_OR_HOME);
            },
          ),
          const Divider(
            color: Color(0xFFFFFCF2),
          ),
          ListTile(
            leading: const Icon(
              Icons.payment,
              color: Color(0xFFCCC5B9),
            ),
            title: Text(
              'PEDIDOS',
              style: GoogleFonts.titilliumWeb(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
            },
          ),
          const Divider(
            color: Color(0xFFFFFCF2),
          ),
          ListTile(
            leading: const Icon(
              Icons.edit,
              color: Color(0xFFCCC5B9),
            ),
            title: Text(
              'EDITAR PRODUTOS',
              style: GoogleFonts.titilliumWeb(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUCTS);
            },
          ),
          const Divider(
            color: Color(0xFFFFFCF2),
          ),
        ],
      ),
    );
  }
}
