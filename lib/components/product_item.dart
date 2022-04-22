import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/models/product.dart';
import 'package:standup_gym_store/models/product_list.dart';
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
              onPressed: () {
                showDialog<bool>(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => Theme(
                    data: Theme.of(context).copyWith(
                      dialogBackgroundColor:
                          Theme.of(context).colorScheme.primary,
                    ),
                    child: AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20,
                        ),
                      ),
                      content: Text(
                        'Are you sure?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20,
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        TextButton(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    ),
                  ),
                ).then((value) {
                  if (value ?? false) {
                    Provider.of<ProductList>(
                      context,
                      listen: false,
                    ).removeProduct(product);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
