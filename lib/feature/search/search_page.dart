import 'package:baltini_kent/components/widget/global_widget/back_button.dart';
import 'package:baltini_kent/feature/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/const/img_string.dart';
import '../product_list/product_list_viewmodel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<SearchVM>(context, listen: false).onChangeToggleHistory();
    Provider.of<SearchVM>(context, listen: false).searchInput = '';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchVM>(builder: (context, vm, child) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: BackButtons(),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 8, 16),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: 40,
                        child: TextFormField(
                          textInputAction: TextInputAction.search,
                          initialValue: vm.searchInput,
                          onChanged: (text) {
                            vm.onChangeSearchInput(text);
                            vm.onChangeToggleRelated();
                            vm.getRelatedItems(text);
                          },
                          onEditingComplete: () {
                            vm.insertrecentlySearched(vm.searchInput);
                            Provider.of<ProductListVM>(context, listen: false)
                                .getSearchedProduct(vm.searchInput);
                            Navigator.pushNamed(
                                context, '/product_list/from_search');
                          },
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsetsDirectional.symmetric(
                                      vertical: 5),
                              prefixIcon: Image.asset(iconSearch),
                              hintText: 'Search...',
                              hintStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              border: InputBorder.none,
                              filled: true,
                              fillColor: const Color(0XFFE8ECEE)),
                        ),
                      )),
                ],
              ),
              vm.toggleHistory
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: vm.recentlySearched.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              vm.onChangeSearchInput(
                                  vm.recentlySearched.elementAt(index));
                              Provider.of<ProductListVM>(context, listen: false)
                                  .getSearchedProduct(vm.searchInput);
                              Navigator.pushNamed(
                                  context, '/product_list/from_search');
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                              child: Text(vm.recentlySearched.elementAt(index),
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                          );
                        },
                      ))
                  : Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: vm.relatedProducts.length >= 4
                                  ? 4
                                  : vm.relatedProducts.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/product_detail',
                                        arguments: vm.relatedProducts[index]);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(vm.relatedProducts[index].title!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 4, 0, 16),
                                        child: Text(
                                            vm.relatedProducts[index].vendor!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(
                                                    color:
                                                        const Color(0XFF121313)
                                                            .withOpacity(0.5))),
                                      )
                                    ],
                                  ),
                                );
                              },
                            )),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextButton(
                              onPressed: () {
                                vm.insertrecentlySearched(vm.searchInput);
                                Provider.of<ProductListVM>(context,
                                        listen: false)
                                    .getSearchedProduct(vm.searchInput);
                                Navigator.pushNamed(
                                    context, '/product_list/from_search');
                              },
                              child: Text(
                                  'VIEW ALL ${vm.relatedProducts.length} PRODUCTS',
                                  style:
                                      Theme.of(context).textTheme.labelMedium)),
                        )),
                      ],
                    ),
            ],
          ),
        ),
      );
    });
  }
}
