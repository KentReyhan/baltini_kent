import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'components/page_route/route_generator.dart';
import 'components/provider/quantity_box_provider.dart';
import 'components/provider/search_provider.dart';
import 'components/theme/app_theme.dart';
import 'feature/cart/cart_viewmodel.dart';
import 'feature/checkout/checkout_viewmodel.dart';
import 'components/hive/hive_helper.dart';
import 'feature/home/home_viewmodel.dart';
import 'feature/product_detail/product_detail_viewmodel.dart';
import 'feature/product_list/product_list_viewmodel.dart';
import 'feature/search/search_viewmodel.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Directory appPath = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appPath.path);

  HiveHelper.initAdapter();
  await HiveHelper.openAllBox();
  //HiveHelper.seedActivity();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeVM()),
      ChangeNotifierProvider(create: (context) => ProductDetailVM()),
      ChangeNotifierProvider(create: (context) => ProductListVM()),
      ChangeNotifierProvider(create: (context) => CartVM()),
      ChangeNotifierProvider(create: (context) => SearchVM()),
      ChangeNotifierProvider(create: (context) => CheckoutVM()),
      ChangeNotifierProvider(create: (context) => SearchProvider()),
      ChangeNotifierProvider(create: (context) => QuantityProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
        theme: AppTheme.themeModel(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
