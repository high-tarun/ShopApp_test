import 'package:flutter/material.dart';

import '../../bloc/product_data_bloc.dart';
import '../../helpers/factory.dart';
import '../../helpers/spacer.dart';

class ProductDetailScreen extends StatefulWidget {
  final String id;
  final String image;
  final String price;
  final String description;
  // final List rating;
  final String title;
  const ProductDetailScreen(
      {Key? key,
      required this.id,
      required this.image,
      required this.price,
      required this.description,
      required this.title})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDataBloc productDataBloc = ProductDataBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // productDataBloc.loadSingleProduct(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      vSpacing(90),
                      Container(
                          // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                          height: MediaQuery.of(context).size.height * 0.55,
                          padding: const EdgeInsets.only(
                            top: 32,
                            left: 32,
                            right: 32,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: Offset(0, 4),
                                blurRadius: 20,
                                spreadRadius: 10,
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60),
                            ),
                            color: Colors.white.withOpacity(0.92),
                          ),
                          child: SizedBox(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.title,
                                  style: ProjectProperty.fontFactory.robotoStyle
                                      .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22,
                                  ),
                                ),
                                // vSpacing(10),
                                Text(
                                  widget.description,
                                  style: ProjectProperty.fontFactory.robotoStyle
                                      .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "\$${widget.price}",
                                  style: ProjectProperty.fontFactory.robotoStyle
                                      .copyWith(
                                    color: ProjectProperty
                                        .colorFactory.primaryColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    // performLogin();
                                  },
                                  child: Text(
                                    "Add to cart",
                                    style: ProjectProperty
                                        .fontFactory.robotoStyle
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
