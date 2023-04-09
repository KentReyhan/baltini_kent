import 'package:baltini_kent/components/provider/search_provider.dart';
import 'package:baltini_kent/feature/product_list/product_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/search/search_viewmodel.dart';
import '../../const/img_string.dart';

class SearchBar extends StatelessWidget {
  final double width;
  const SearchBar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 8, 16),
        child: GestureDetector(
          onTap: () {
            Provider.of<SearchVM>(context, listen: false).getAllProduct();
            Navigator.pushNamed(context, '/search');
          },
          child: Container(
            width: width,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0XFFE8ECEE),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(iconSearch),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('Search...'),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
