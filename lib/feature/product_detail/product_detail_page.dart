import 'package:baltini_kent/feature/product_detail/product_detail_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/const/img_string.dart';
import '../../components/utils/string_utils.dart';
import '../../components/widget/global_widget/cart.dart';
import '../../components/widget/global_widget/quantity_box.dart';
import '../../components/widget/global_widget/top_banner.dart';
import '../../components/widget/product_detail_widget/info_widget.dart';
import '../../components/widget/product_detail_widget/product_detail_text.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _selectedImageIndex = 0;
  bool _init = false;
  ProductDetailVM vm = ProductDetailVM();

  @override
  Widget build(BuildContext context) {
    Object? id = ModalRoute.of(context)?.settings.arguments;
    if (_init == false) {
      vm.initialize(id, context);
      _init = true;
    }
    return Consumer<ProductDetailVM>(
      builder: (context, vm, child) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const BackButton(),
                      Expanded(
                        child: Text(
                          '${vm.product!.vendor} - ${vm.product!.productType}',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Cart()
                    ]),
              ),
              const TopBanner(),
              Column(
                children: [
                  CarouselSlider(
                      options: CarouselOptions(
                        height: 260,
                        viewportFraction: 0.45,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _selectedImageIndex = index;
                          });
                        },
                      ),
                      items: vm.images),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      child: AnimatedSmoothIndicator(
                        activeIndex: _selectedImageIndex,
                        count: vm.images.length,
                        effect: const ScrollingDotsEffect(
                            activeDotColor: Color(0XFF121313),
                            dotColor: Color(0XFFE8ECEE),
                            dotWidth: 10,
                            dotHeight: 10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  vm.product!.vendor,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  vm.product!.productType,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  StringUtils.formatToIDR(vm.product!.price),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0XFF121313).withOpacity(0.5)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: Theme.of(context).textTheme.labelLarge,
                      text:
                          'or 4 interest-free payments of ${StringUtils.formatToIDR(vm.product!.price! / 4)} with '),
                  WidgetSpan(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color(0XFFFEF1DE),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text('afterpay',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  )
                ])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'SIZE',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            minimumSize: const Size(8, 8),
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(
                          'SIZE CHART',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(decoration: TextDecoration.underline),
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GroupButton(
                  isRadio: true,
                  buttons: vm.size!,
                  controller: GroupButtonController(selectedIndex: 0),
                  options: const GroupButtonOptions(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    selectedColor: Color(0XFF121313),
                    unselectedBorderColor: Color(0XFFC9CFD2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Text(
                  'QUANTITY',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const QuantityBox(),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Text(
                  'PRODUCT DETAIL',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Text(
                  'Hooded Neck\nFront Zip Closure\nTwo Side Pocket\nUnlined inner\n100% Polyamide\nMade in Italy\nModel is 184 cm tall and wear size 48 IT',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const ProductDetailText(detailLabel: 'Gender', detailText: 'Men'),
              const ProductDetailText(
                  detailLabel: 'Material', detailText: '100% Polyamide'),
              ProductDetailText(
                  detailLabel: 'Color',
                  detailText: vm.product!.options[0]['values'][0]),
              const ProductDetailText(detailLabel: 'Made in', detailText: 'IT'),
              ProductDetailText(
                  detailLabel: 'Product ID',
                  detailText: vm.product!.id.toString()),
              const Divider(color: Colors.black),
              const SizedBox(height: 8),
              const InfoWidget(text: 'Shipping & Return'),
              const SizedBox(height: 16),
              const InfoWidget(text: 'Authenticity Guarantee'),
              const SizedBox(height: 16),
              const InfoWidget(text: 'Ask A Question'),
              const SizedBox(height: 8),
              const Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  'RECOMMENDED ITEMS',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              CarouselSlider(
                  options: CarouselOptions(
                      height: 380,
                      viewportFraction: 0.5,
                      enableInfiniteScroll: false,
                      padEnds: false),
                  items: vm.recommendedProductsCard),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  'RECENTLY VIEWED',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              CarouselSlider(
                  options: CarouselOptions(
                      height: 380,
                      viewportFraction: 0.5,
                      enableInfiniteScroll: false,
                      padEnds: false),
                  items: vm.recentlyViewedCard),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: const Color(0XFFE8ECEE),
                        content: Row(
                          children: [
                            Text('Item Added To Cart',
                                style: Theme.of(context).textTheme.bodyMedium),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 4.2),
                            TextButton(
                                onPressed: () {},
                                child: Text('UNDO',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium)),
                            IconButton(
                                onPressed: () => ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar(),
                                icon: Image.asset(iconClose)),
                          ],
                        ),
                      ));
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size.fromHeight(40)),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFF121313))),
                    child: Text('ADD TO CART',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.white))),
              )
            ],
          ),
        ));
      },
    );
  }
}
