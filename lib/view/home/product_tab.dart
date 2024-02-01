import 'package:flutter/material.dart';
import 'package:test_project1/bloc/product_data_bloc.dart';
import 'package:test_project1/bloc/product_data_events.dart';
import 'package:test_project1/model/product_model.dart';
import 'package:test_project1/view/screens/product_detail_screen.dart';

import '../../helpers/factory.dart';
import '../../helpers/spacer.dart';

class ProductTabScreen extends StatefulWidget {
  const ProductTabScreen({Key? key}) : super(key: key);

  @override
  State<ProductTabScreen> createState() => _ProductTabScreenState();
}

class _ProductTabScreenState extends State<ProductTabScreen> {
  ProductDataBloc productDataBloc = ProductDataBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productDataBloc.loadProductData();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductsDataEvents>(
      stream: productDataBloc.productsDataEvents,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data is ProductsDataLoaded) {
          ProductsDataLoaded data = snapshot.data as ProductsDataLoaded;
          return Container(
            margin: EdgeInsets.only(top: 20),
            child: showProductList(items: data.products),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget showProductList({required List<Products> items}) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          // height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xffa0a0a0).withOpacity(0.15),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                        id: items[index].id,
                        image: items[index].image,
                        price: items[index].price,
                        description: items[index].description,
                        title: items[index].title,
                      )));
            },
            leading: Container(
                margin: EdgeInsets.only(right: 10),
                height: 100,
                width: 50,
                child: Image.network(items[index].image)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index].title,
                  style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                vSpacing(10),
                Text(
                  "Price : \$${items[index].price}",
                  style: ProjectProperty.fontFactory.robotoStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: items.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return vSpacing(10);
      },
    );
  }
}
