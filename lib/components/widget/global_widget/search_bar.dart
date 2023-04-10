import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/search/search_viewmodel.dart';
import '../../const/img_string.dart';

class SearchBar extends StatelessWidget {
  final double width;
  final String? text;
  final String? isOriginSearch;
  const SearchBar(
      {super.key, required this.width, this.text, this.isOriginSearch});

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
            width: width - 10,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0XFFE8ECEE),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isOriginSearch == null
                  ? Row(children: [
                      Image.asset(iconSearch),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: text == null
                            ? const Text('Search...')
                            : Text(text!),
                      )
                    ])
                  : Row(
                      children: [
                        Image.asset(iconSearch),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: text == null
                              ? const Text('Search...')
                              : Text(text!),
                        ),
                        SizedBox(width: width / 2),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: IconButton(
                                icon: Image.asset(iconClose),
                                onPressed: () {
                                  Provider.of<SearchVM>(context, listen: false)
                                      .onChangeSearchInput('');
                                }),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ));
  }
}
