import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/modules/product_info/product_info_page.dart';
import 'package:e_commerce/ui_kit.dart/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/ui_kit.dart/ui_kit.dart' as U;

//enum Type { regular, New, sale }

class ProductCard extends StatelessWidget {
  final Product product;
  final double? width;
  final double? height;
  // final Type type;
  const ProductCard({
    super.key,
    required this.product,
    // required this.type,
    this.width = 150,
    this.height = 269,
  });
  double getOff() {
    double temp = 0;
    temp = product.price * (product.off! / 100);
    return product.price - temp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(ProductInfoPage.path, extra: product);
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 184,
                  width: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: U.Image(
                      // height: 104,
                      boxfit: BoxFit.fill,
                      image: product.image,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    U.Stars(
                      stars: product.getRating.round(),
                      rateCount: product.ratings.length,
                    ),
                    SizedBox(width: 4),
                  ],
                ),
                //  SizedBox(height: 6),
                U.Text(
                  fontSize: U.TextSize.s11,
                  weight: U.TextWeight.regular,
                  color: U.Theme.gray,
                  product.brand,
                ),
                // SizedBox(height: 6),
                Text(
                  overflow: TextOverflow.fade,
                  //  softWrap: true,
                  maxLines: 1,

                  product.title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                // U.Text(fontSize: 16, text: product.title),
                Row(
                  children: [
                    U.Text(
                      lineThrough: product.off != null,
                      '${product.price.toString()}\$',
                    ),
                    SizedBox(width: 5),
                    if (product.off != null)
                      U.Text(
                        weight: U.TextWeight.medium,
                        color: U.Theme.primary,
                        '${getOff().toString()}\$',
                      ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: 1,
              bottom: 60,
              child: U.IconButton(
                color: U.Theme.white,
                size: IconButtonSize.small,
                icon: U.Icons.favorite,
                onTap: () {},
              ),
            ),
            if (product.off != null || product.newProduct)
              Positioned(
                top: 8,
                right: 5,
                child: Row(
                  children: [
                    if (product.off != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Container(
                          width: 40,
                          height: 24,
                          decoration: BoxDecoration(
                            color: U.Theme.primary,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Center(
                            child: U.Text(
                              fontSize: U.TextSize.s11,
                              weight: U.TextWeight.semiBold,
                              color: U.Theme.white,
                              '- ${product.off.toString()}%',
                            ),
                          ),
                        ),
                      ),
                    if (product.newProduct)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Container(
                          width: 40,
                          height: 24,
                          decoration: BoxDecoration(
                            color: U.Theme.black,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Center(
                            child: U.Text(
                              fontSize: U.TextSize.s11,
                              weight: U.TextWeight.semiBold,
                              color: U.Theme.white,
                              'جدید',
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

            // if (product.newProduct)
            //   Positioned(
            //     top: 15,
            //     left: 14,
            //     child: Container(
            //       width: 40,
            //       height: 24,
            //       decoration: BoxDecoration(
            //         color: U.Theme.black,
            //         borderRadius: BorderRadius.circular(29),
            //       ),
            //       child: Center(child: U.Text(color: U.Theme.white, 'New')),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
