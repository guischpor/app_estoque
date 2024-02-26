import 'named_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_estoque/presentation/presenter/pages/splash/splash_page.dart';
import 'package:app_estoque/presentation/presenter/pages/home/view/home_page.dart';
import 'package:app_estoque/presentation/presenter/pages/login/view/login_page.dart';
import 'package:app_estoque/presentation/presenter/pages/signup/view/signup_page.dart';
import '../../presentation/presenter/pages/product_detail/view/product_detail_page.dart';
import '../../presentation/presenter/pages/stock_detail_product/widget/add_product_form.dart';
import '../../presentation/presenter/pages/stock_detail_product/view/stock_detail_product_page.dart';
import 'package:app_estoque/presentation/presenter/pages/create_stock_form/view/create_stock_form.dart';


final _key = GlobalKey<NavigatorState>();
final GoRouter routeProvider = GoRouter(
  navigatorKey: _key,
  initialLocation: NamedRoutes.splash,
  routes: <RouteBase>[
    GoRoute(
      path: NamedRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: NamedRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: NamedRoutes.signUp,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: NamedRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '${NamedRoutes.createStockForm}/:listID/:isEdit/:isAdd',
      name: NamedPaths.createStockForm,
      builder: (context, state) {
        return CreateStockForm(
          isAdd: state.pathParameters['isAdd'] == 'true' ? true : false,
          isEdit: state.pathParameters['isEdit'] == 'true' ? true : false,
          listID: state.pathParameters['listID'],
        );
      },
    ),
    GoRoute(
      path: '${NamedRoutes.stockDetail}/:listID',
      name: NamedPaths.stockDetail,
      builder: (context, state) {
        return StockDetailProductPage(
          listID: state.pathParameters['listID'],
        );
      },
    ),
    GoRoute(
      path:
          '${NamedRoutes.addProductForm}:listID/:isEdit/:isAdd/:productID/:userID',
      name: NamedPaths.addProductForm,
      builder: (context, state) {
        return AddProductForm(
          isAdd: state.pathParameters['isAdd'] == 'true' ? true : false,
          isEdit: state.pathParameters['isEdit'] == 'true' ? true : false,
          listID: state.pathParameters['listID'],
          productID: state.pathParameters['productID'],
          userID: state.pathParameters['userID'],
        );
      },
    ),
    GoRoute(
      path: '${NamedRoutes.productDetail}/:productID/:listID',
      name: NamedPaths.productDetail,
      builder: (context, state) {
        return ProductDetailPage(
          productID: state.pathParameters['productID'],
          listID: state.pathParameters['listID'],
        );
      },
    ),
  ],
);
