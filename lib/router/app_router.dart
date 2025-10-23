
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/models/product_model.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/product_detail_screen.dart';
import 'package:myapp/screens/product_listing_screen.dart';
import 'package:myapp/screens/sign_in_screen.dart';
import 'package:myapp/screens/sign_up_screen.dart';
import 'package:myapp/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/signin',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/products',
      builder: (BuildContext context, GoRouterState state) {
        return const ProductListingScreen();
      },
    ),
    GoRoute(
      path: '/product-details',
      builder: (BuildContext context, GoRouterState state) {
        final product = state.extra as Product;
        return ProductDetailScreen(product: product);
      },
    ),
  ],
);
