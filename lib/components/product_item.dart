import 'package:flutter/material.dart';
import 'package:standup_gym_store/models/product.dart';
import 'package:standup_gym_store/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: const Color(0xFF252422),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          product.imageUrl,
          scale: 18,
        ),
      ),
      title: Text(
        product.name,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 20,
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Color(0xFFCCC5B9),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                  arguments: product,
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Color(0xFFF36464),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
