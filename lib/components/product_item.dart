import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/exceptions/http_exceptions.dart';
import 'package:standup_gym_store/models/product.dart';
import 'package:standup_gym_store/models/product_list.dart';
import 'package:standup_gym_store/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = ScaffoldMessenger.of(context);

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
        style: GoogleFonts.titilliumWeb(
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 18,
          ),
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
                        'DELETAR PRODUTO',
                        style: GoogleFonts.titilliumWeb(
                          textStyle: const TextStyle(
                            color: Color(0xFFFFFCF2),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      content: Text(
                        'VOC?? TEM CERTEZA?',
                        style: GoogleFonts.titilliumWeb(
                          textStyle: const TextStyle(
                            color: Color(0xFFFFFCF2),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text(
                            'N??O',
                            style: GoogleFonts.titilliumWeb(
                              textStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(false),
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
                          onPressed: () => Navigator.of(context).pop(true),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).then((value) async {
                  if (value ?? false) {
                    try {
                      await Provider.of<ProductList>(
                        context,
                        listen: false,
                      ).removeProduct(product);
                    } on HttpException catch (error) {
                      message.showSnackBar(
                        SnackBar(
                          duration: const Duration(
                            seconds: 1,
                          ),
                          content: Text(
                            error.toString(),
                            style: GoogleFonts.titilliumWeb(
                              textStyle: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
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
