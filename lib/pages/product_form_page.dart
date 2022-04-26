import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standup_gym_store/models/product.dart';
import 'package:standup_gym_store/models/product_list.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

final _formKey = GlobalKey<FormState>();

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  final _formData = <String, Object>{};

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = product.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  bool isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg') ||
        url.toLowerCase().endsWith('');
    return isValidUrl && endsWithFile;
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<ProductList>(
        context,
        listen: false,
      ).saveProduct(_formData);

      Navigator.of(context).pop();
    } catch (error) {
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Ocorreu um erro!'),
          content: const Text('Ocorreu um erro ao tentar salvar o produto'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Product Form',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        color: Color(
                          0xFFFFFCF2,
                        ),
                      ),
                      initialValue: _formData['name']?.toString(),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocus);
                      },
                      onSaved: (name) => _formData['name'] = name ?? '',
                      validator: (_name) {
                        final name = _name ?? '';

                        if (name.trim().isEmpty) {
                          return 'The name is mandatory';
                        }
                        if (name.trim().length < 3) {
                          return 'Name needs at least three letters';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Color(
                          0xFFFFFCF2,
                        ),
                      ),
                      initialValue: _formData['price']?.toString(),
                      decoration: InputDecoration(
                        labelText: 'Price',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      focusNode: _priceFocus,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_descriptionFocus);
                      },
                      onSaved: (price) => _formData['price'] =
                          double.tryParse(price ?? '0') as Object,
                      validator: (_price) {
                        final priceString = _price ?? '';
                        try {
                          final price = double.tryParse(priceString) ?? -1;

                          if (price <= 0) {
                            return 'Enter a valid price';
                          }
                        } catch (error) {
                          return 'Enter a valid price';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Color(
                          0xFFFFFCF2,
                        ),
                      ),
                      initialValue: _formData['description']?.toString(),
                      decoration: InputDecoration(
                        labelText: 'Description',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      focusNode: _descriptionFocus,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      onSaved: (description) =>
                          _formData['description'] = description ?? '',
                      validator: (_description) {
                        final description = _description ?? '';

                        if (description.trim().isEmpty) {
                          return 'The description is mandatory';
                        }
                        if (description.trim().length < 3) {
                          return 'Description needs at least ten letters';
                        }
                        return null;
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(
                              color: Color(
                                0xFFFFFCF2,
                              ),
                            ),
                            decoration: InputDecoration(
                              labelText: 'Image URL',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            textInputAction: TextInputAction.done,
                            focusNode: _imageUrlFocus,
                            keyboardType: TextInputType.url,
                            controller: _imageUrlController,
                            onFieldSubmitted: (_) => _submitForm(),
                            onSaved: (imageUrl) =>
                                _formData['imageUrl'] = imageUrl ?? '',
                            validator: (_imageUrl) {
                              final imageUrl = _imageUrl ?? '';
                              if (!isValidImageUrl(imageUrl)) {
                                return 'Please, provide a valid url';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(
                                0xFFFFFCF2,
                              ),
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: _imageUrlController.text.isEmpty
                              ? const Text(
                                  'Inform the url',
                                  style: TextStyle(
                                    color: Color(
                                      0xFFFFFCF2,
                                    ),
                                    fontSize: 16,
                                  ),
                                )
                              : Image.network(
                                  _imageUrlController.text,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
