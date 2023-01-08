import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/app_router.dart';
import 'package:saba_lab444/model/product_model.dart';
import 'package:saba_lab444/providers/business_provider.dart';
import 'package:saba_lab444/providers/customer_provider.dart';

class ProductItemCustomer extends StatelessWidget {
  final ProductModel product;

  const ProductItemCustomer({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bProvider = Provider.of<BusinessProvider>(context);
    return InkWell(
      onTap: () {
        _bProvider.selectedProductModel = product;
        Navigator.pushNamed(context, AppRoute.productDetails);
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          LineIcons.addToShoppingCart,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _bProvider.selectedProductModel = product;
                            Navigator.pushNamed(
                                context, AppRoute.productDetails);
                          },
                          child: Icon(
                            LineIcons.verticalEllipsis,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          " ${product.name}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "${product.price}SR",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(product.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
