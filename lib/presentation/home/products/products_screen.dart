import 'package:deliveryApp/data/in_memory_products.dart';
import 'package:deliveryApp/data/productsEntity.dart';
import 'package:deliveryApp/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _ItemProduct(product: product);
        },
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final Product product;

  const _ItemProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: CircleAvatar(
                child: ClipOval(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                )),
                backgroundColor: Colors.black,
              )),
              Expanded(
                child: Column(
                  children: [
                    Text(product.name),
                    Text(product.description,
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            .copyWith(color: DeliveryColors.lightGrey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${product.price} €'),
                  ],
                ),
              ),
              DeliveryButton(
                text: 'Add',
                onTap: () {},
                padding: const EdgeInsets.symmetric(vertical: 4.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
