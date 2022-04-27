import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/models/cart.dart';
import 'package:standup_gym_store/models/product.dart';
import 'package:standup_gym_store/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: const Color(0xFF252422),
          leading: IconButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              product.toggleFavorite();
            },
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: const Color(0xFFCCC5B9),
            ),
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.titilliumWeb(
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
            ),
          ),
          trailing: IconButton(
            color: Colors.black,
            icon: const Icon(
              Icons.add_shopping_cart_outlined,
              color: Color(0xFFCCC5B9),
            ),
            onPressed: () {
              cart.addItem(product);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'PRODUTO ADICIONADO COM SUCESSO!',
                    style: GoogleFonts.titilliumWeb(
                      textStyle: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  duration: const Duration(seconds: 1),
                  action: SnackBarAction(
                    label: 'DESFAZER',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
