import 'package:baltini_kent/feature/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/const/img_string.dart';
import '../../components/const/text_string.dart';
import '../../components/widget/home_widget/brand_banner.dart';
import '../../components/widget/global_widget/cart.dart';
import '../../components/widget/global_widget/clickable_image.dart';
import '../../components/widget/global_widget/product_card.dart';
import '../../components/widget/global_widget/search_bar.dart';
import '../../components/widget/global_widget/top_banner.dart';
import '../cart/cart_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeVM>(context, listen: false).getHomeItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchBar(width: MediaQuery.of(context).size.width / 1.3),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  // ignore: prefer_const_constructors
                  child: Cart(),
                )
              ],
            ),
            const TopBanner(),
            const ClickableImage(x: 7, y: 4, assetImage: collectionBanner),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: const [
                    Expanded(
                      child:
                          ClickableImage(x: 2, y: 3, assetImage: womenBanner),
                    ),
                    Expanded(
                      child: ClickableImage(x: 2, y: 3, assetImage: menBanner),
                    ),
                  ],
                )),
            const ClickableImage(x: 3, y: 4, assetImage: spotlightBanner1),
            const ClickableImage(x: 3, y: 4, assetImage: spotlightBanner2),
            const ClickableImage(x: 3, y: 4, assetImage: spotlightBanner3),
            Center(
                child: Text('NEW ARRIVALS',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(decoration: TextDecoration.underline))),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text('VIEW ALL',
                      style: Theme.of(context).textTheme.labelMedium)),
            ),
            Consumer<HomeVM>(
              builder: (context, vm, child) {
                if (vm.isLoading) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ));
                } else {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: vm.product.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 4,
                              mainAxisExtent: 400),
                      itemBuilder: (context, index) {
                        return ProductCard(product: vm.product[index]);
                      });
                }
              },
            ),
            Center(
                child: Text('EXCLUSIVE PIECES',
                    style: Theme.of(context).textTheme.displayLarge)),
            const BrandBanner(
                brandBannerImage: brandBanner1,
                brandBannerTitle: 'ALEXANDER MCQUEEN',
                brandBannerText: brandBannerText1),
            const BrandBanner(
                brandBannerImage: brandBanner2,
                brandBannerTitle: 'DOLCE & GABBANA',
                brandBannerText: brandBannerText2),
            const BrandBanner(
                brandBannerImage: brandBanner3,
                brandBannerTitle: 'VERSACE',
                brandBannerText: brandBannerText3),
          ],
        ),
      ),
    );
  }
}
