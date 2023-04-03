import 'package:baltini_kent/components/widget/global_widget/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/const/img_string.dart';
import '../../components/widget/global_widget/cart.dart';
import '../../components/widget/global_widget/product_card.dart';
import '../../components/widget/global_widget/search_bar.dart';
import 'product_list_viewmodel.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListVM>(
      builder: (context, vm, child) {
        return Scaffold(
          body: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: BackButton(),
                ),
                SearchBar(
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Cart(),
                )
              ]),
              const TopBanner(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.25,
                          height: 48,
                          //padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: RichText(
                                text: TextSpan(children: [
                              WidgetSpan(child: Image.asset(iconFilter)),
                              TextSpan(
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  text: 'FEATURED')
                            ])),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.25,
                          height: 48,
                          //padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: RichText(
                                text: TextSpan(children: [
                              WidgetSpan(child: Image.asset(iconSort)),
                              TextSpan(
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  text: 'SORT')
                            ])),
                          ),
                        ),
                      )
                    ]),
              ),
              vm.isLoading == false && vm.isEmpty == false
                  ? Expanded(
                      child: GridView.builder(
                        physics: const ScrollPhysics(),
                        itemCount: vm.product.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 4,
                                mainAxisExtent: 400),
                        itemBuilder: (context, index) {
                          return ProductCard(product: vm.product[index]);
                        },
                      ),
                    )
                  : vm.isLoading == true
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ))
                      : Column(children: [])
            ],
          ),
        );
      },
    );
  }
}
