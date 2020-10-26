import 'package:deliveryApp/data/in_memory_products.dart';
import 'package:deliveryApp/data/productsEntity.dart';
import 'package:deliveryApp/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key, this.callback}) : super(key: key);

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shooping Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: _FullCart(),
        ),
      ),
    );
  }
}

class _FullCart extends StatelessWidget {
  const _FullCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
                itemCount: products.length,
                itemExtent: 180,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _ShoppingCartProduct(product: product);
                }),
          ),
        ),
        Expanded(
          flex: 2,
          child: _TotalShoppingCard(),
        )
      ],
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart({Key key, this.callback}) : super(key: key);

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset('assets/lotties/empty.json'),
              ],
            ),
            Text('There are no products'),
            SizedBox(
              height: 20,
            ),
            DeliveryButton(
              onTap: callback,
              text: 'Go to shopping',
              padding: const EdgeInsets.all(12.0),
            )
          ],
        ),
      ),
    );
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  final Product product;

  const _ShoppingCartProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            Card(
              color: Theme.of(context).canvasColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        flex: 4,
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
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: DeliveryColors.veryLightGrey,
                                  ),
                                  child: Icon(Icons.remove,
                                      color: DeliveryColors.purple),
                                ),
                              ),
                              Text(
                                '1',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: DeliveryColors.purple,
                                  ),
                                  child: Icon(Icons.add,
                                      color: DeliveryColors.white),
                                ),
                              ),
                              Text(
                                '${product.price}',
                                style: TextStyle(
                                    color: DeliveryColors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              height: 35,
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: DeliveryColors.pink,
                  child: Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: DeliveryColors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TotalShoppingCard extends StatelessWidget {
  const _TotalShoppingCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Theme.of(context).canvasColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '200 €',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 12),
                  ),
                  Text(
                    'Free',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    '200.00€',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            Spacer(),
            DeliveryButton(
              onTap: () {},
              text: 'Checkout',
            ),
          ],
        ),
      ),
    );
  }
}
