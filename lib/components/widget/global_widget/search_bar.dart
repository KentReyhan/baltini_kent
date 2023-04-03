import 'package:baltini_kent/components/provider/search_provider.dart';
import 'package:baltini_kent/feature/product_list/product_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/img_string.dart';

class SearchBar extends StatelessWidget {
  final double width;
  const SearchBar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, search, child) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 8, 16),
          child: SizedBox(
            width: width,
            height: 40,
            child: TextFormField(
              textInputAction: TextInputAction.search,
              initialValue: search.searchInput,
              onChanged: (text) {
                search.onChangeSearchInput(text);
              },
              onFieldSubmitted: (text) {
                search.searchInput ??= '';
                Provider.of<ProductListVM>(context, listen: false)
                    .getSearchedProduct(search.searchInput!);
                Navigator.pushNamed(context, '/product_list');
              },
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 18),
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsetsDirectional.symmetric(vertical: 5),
                  prefixIcon: Image.asset(iconSearch),
                  hintText: 'Search...',
                  hintStyle: Theme.of(context).textTheme.displayMedium,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0XFFE8ECEE)),
            ),
          ));
    });
  }
}
