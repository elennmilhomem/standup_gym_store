import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/models/cart.dart';
import 'package:standup_gym_store/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: const Color(0xFFF36464),
        child: const Icon(
          Icons.delete_outline,
          color: Color(0xFFFFFCF2),
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color(0xFF403D39),
            title: Text(
              'VOCÊ TEM CERTEZA?',
              style: GoogleFonts.titilliumWeb(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFCF2),
                ),
              ),
            ),
            content: Text(
              'QUER REMOVER UM ITEM DO CARRINHO?',
              style: GoogleFonts.titilliumWeb(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFFFCF2),
                ),
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'NÃO',
                  style: GoogleFonts.titilliumWeb(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  'SIM',
                  style: GoogleFonts.titilliumWeb(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      child: Card(
        color: const Color(0xFF252422),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(
              cartItem.name,
              style: GoogleFonts.titilliumWeb(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                ),
              ),
            ),
            subtitle: Text(
              'TOTAL:  R\$ ${cartItem.price * cartItem.quantity}',
              style: GoogleFonts.titilliumWeb(
                textStyle: const TextStyle(
                  color: Color(0xFFCCC5B9),
                  fontSize: 16,
                ),
              ),
            ),
            trailing: Text(
              '${cartItem.quantity}x',
              style: GoogleFonts.titilliumWeb(
                textStyle: const TextStyle(
                  color: Color(0xFFCCC5B9),
                  fontSize: 16,
                ),
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: FittedBox(
                  child: Text(
                    '${cartItem.price}',
                    style: GoogleFonts.titilliumWeb(
                      textStyle: const TextStyle(
                        color: Color(0xFFFFFCF2),
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
