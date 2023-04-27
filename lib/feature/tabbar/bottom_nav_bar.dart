import 'package:baltini_kent/components/const/img_string.dart';
import 'package:flutter/material.dart';

import '../category/category_page.dart';
import '../home/home_page.dart';
import '../my_account/my_account_page.dart';
import '../my_order/my_order_page.dart';

class ActivityBar extends StatefulWidget {
  final int index;
  const ActivityBar({super.key, required this.index});

  @override
  State<StatefulWidget> createState() => _ActivityBarState();
}

class _ActivityBarState extends State<ActivityBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: widget.index);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              HomePage(
                onNext: () => _tabController.index = 1,
              ),
              CategoryPage(
                onNext: () => _tabController.index = 2,
              ),
              MyOrderPage(
                onNext: () => _tabController.index = 3,
              ),
              MyAccountPage(
                onNext: () => _tabController.index = 4,
              ),
            ]),
          ),
        ]),
        bottomNavigationBar: TabBar(
            //isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            dividerColor: Colors.transparent,
            labelStyle: const TextStyle(
                fontFamily: 'Futura',
                fontWeight: FontWeight.w800,
                fontSize: 10),
            labelPadding: const EdgeInsets.symmetric(vertical: 2),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                  icon: _tabController.index == 1
                      ? Image.asset(navIconHomeActive)
                      : Image.asset(navIconHomeInactive),
                  text: 'HOME'),
              Tab(
                  icon: _tabController.index == 2
                      ? Image.asset(navIconCategoryActive)
                      : Image.asset(navIconCategoryInactive),
                  text: 'CATEGORY'),
              Tab(
                  icon: _tabController.index == 3
                      ? Image.asset(navIconMyOrderActive)
                      : Image.asset(navIconMyOrderInactive),
                  text: 'MY ORDER'),
              Tab(
                  icon: _tabController.index == 4
                      ? Image.asset(navIconMyAccountActive)
                      : Image.asset(navIconMyAccountInactive),
                  text: 'MY ACCOUNT')
            ]),
      ),
    );
  }
}
