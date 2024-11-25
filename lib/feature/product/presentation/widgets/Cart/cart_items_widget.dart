import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/svg_icons.dart';
import '../../../data/datasources/cart_page_userchange.dart';
import '../../../domain/entities/product_entity.dart';
import '../../pages/cart_page.dart';



class CartItemsWidget extends StatefulWidget   {
  final String? images;
  final String? price;
  final String? color;
  final String? title;
  final int? id;

  const CartItemsWidget({
    Key? key,
    required this.images,
    required this.price,
    required this.title,
    required this.color,
    required this.id,
  }) : super(key: key);

  @override
  State<CartItemsWidget> createState() => _CartItemsWidgetState();
}

class _CartItemsWidgetState extends State<CartItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(left: 20),
        color: AppColors.buttonBarColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(12)
                  ),
                  height: 95,
                  width: 95,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: CachedNetworkImage(
                      imageUrl: widget.images ?? '',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          widget.title ?? '',
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 21,
                              fontFamily: 'MarkPronormal400',
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                        ),
                      ),
                      const SizedBox(height: 7,),
                      Text(
                        widget.price.toString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 21,
                            fontFamily: 'MarkPronormal400',
                            fontWeight: FontWeight.w600,
                            color: AppColors.iconColor
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                const Expanded(child: SizedBox()),
                Container(
                    height: 100,
                    width: 30,
                    decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadiusDirectional.circular(12)
                    ),

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState((){
                              final cartDataProvider = CartDataProvider();
   //                           cartDataProvider.add();
                            });},
                            child: Expanded(
                              child: IconButton(
                                onPressed: () {},
                                icon: svgMinus,
                              ), ),
                          ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon:  Text(
                                  widget.id.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                  )
                              )
                          ),
                        ),
                          GestureDetector(
                               onTap: (){
                               setState((){
                                 final cartDataProvider = CartDataProvider();
          //                        cartDataProvider.deleteItem();
                               });},
                            child: Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: svgPlus
                              ),
                            ),),
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), backgroundColor: AppColors.buttonBarColor
                    ),
                    child: SvgPicture.asset(
                      assetCart,
                      height: 18,
                    )
                ),
              ]
          ),
        )
    );
  }
}
