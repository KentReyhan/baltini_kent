import 'package:baltini_kent/components/provider/search_provider.dart';
import 'package:baltini_kent/feature/home/home_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'components/page_route/route_gen/route_generator.dart';
import 'components/theme/app_theme.dart';
import 'feature/product_detail/product_detail_viewmodel.dart';
import 'feature/product_list/product_list_viewmodel.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeVM()),
      ChangeNotifierProvider(create: (context) => ProductDetailVM()),
      ChangeNotifierProvider(create: (context) => ProductListVM()),
      ChangeNotifierProvider(create: (context) => SearchProvider()),
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
