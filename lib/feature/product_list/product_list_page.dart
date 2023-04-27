import 'package:baltini_kent/components/widget/global_widget/top_bar/top_banner.dart';
import 'package:baltini_kent/feature/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/const/img_string.dart';
import '../../components/widget/global_widget/item_empty.dart';
import '../../components/widget/global_widget/has_images/product_card.dart';
import '../../components/widget/global_widget/search_bar.dart';
import '../../components/widget/global_widget/top_bar/back_button.dart';
import '../../components/widget/global_widget/top_bar/cart.dart';
import '../cart/cart_viewmodel.dart';
import 'product_list_viewmodel.dart';

class ProductListPage extends StatelessWidget {
  final bool isOriginSearch;
  const ProductListPage({super.key, required this.isOriginSearch});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListVM>(
      builder: (context, vm, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                !isOriginSearch
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: BackButtons(isOriginSearch: 'yes'),
                            ),
                            SearchBar(
                              width: MediaQuery.of(context).size.width / 1.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Cart(
                                  key: Key(Provider.of<CartVM>(context,
                                          listen: false)
                                      .cartProduct
                                      .length
                                      .toString())),
                            )
                          ])
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: BackButtons(isOriginSearch: 'yes'),
                            ),
                            Consumer<SearchVM>(
                              builder: (context, search, child) {
                                return SearchBar(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    text: search.searchInput,
                                    isOriginSearch: 'yes');
                              },
                            ),
                          ]),
                const TopBanner(),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                              ),
                              context: context,
                              builder: (context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10.75,
                                          height: 4,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text('FILTER',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge),
                                    ),
                                    Expanded(
                                        child: ListView.builder(
                                      itemCount: vm.filter.length,
                                      itemBuilder: (context, index) {
                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                activeColor: Colors.black,
                                                title: Text(vm.filter[index],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium),
                                                value: false,
                                                onChanged: (input) {});
                                          },
                                        );
                                      },
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 0, 16, 16),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ButtonStyle(
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      const Size.fromHeight(
                                                          40)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0XFF121313))),
                                          child: Text('FILTER',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                      color: Colors.white))),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.25,
                            height: 48,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Center(
                                child: Row(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 8),
                                child: Image.asset(iconFilter),
                              ),
                              Text('FILTER',
                                  style:
                                      Theme.of(context).textTheme.displayMedium)
                            ])),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                              ),
                              context: context,
                              builder: (context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10.75,
                                          height: 4,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text('SORT PRODUCT',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge),
                                    ),
                                    Expanded(
                                        child: ListView.builder(
                                      itemCount: vm.sort.length,
                                      itemBuilder: (context, index) {
                                        return RadioListTile(
                                            activeColor: Colors.black,
                                            title: Text(vm.sort[index],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                            value: vm.sort[index],
                                            groupValue: vm.selectedSort,
                                            onChanged: (input) {
                                              vm.onChangedSelectedSort(input!);
                                              Navigator.pop(context);
                                            });
                                      },
                                    ))
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width / 2.25,
                              height: 48,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 8),
                                    child: Image.asset(iconSort),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text('SORT',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      fontSize: 10,
                                                      color: const Color(
                                                              0XFF121313)
                                                          .withOpacity(0.5))),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(vm.selectedSort,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        )
                      ]),
                ),
                !vm.isLoading && !vm.isEmpty
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
                    : !vm.isLoading && vm.isEmpty
                        ? const ItemEmpty()
                        : const Center(
                            child: Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ))
              ],
            ),
          ),
        );
      },
    );
  }
}
