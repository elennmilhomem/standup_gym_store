import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standup_gym_store/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    Key? key,
    product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          product.name,
          style: GoogleFonts.titilliumWeb(
            textStyle: const TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'SOBRE',
                      style: GoogleFonts.titilliumWeb(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'DETALHES',
                      style: GoogleFonts.titilliumWeb(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'AVALIAÇÕES',
                      style: GoogleFonts.titilliumWeb(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.titilliumWeb(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'R\$ ${product.price}',
                    style: GoogleFonts.titilliumWeb(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
