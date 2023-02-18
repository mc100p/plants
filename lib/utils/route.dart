import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plants/model/plants_model.dart';
import 'package:plants/pages/details.dart';
import 'package:plants/pages/homepage.dart';
import 'package:plants/utils/magic_string.dart';

class RouteGenerator {
  GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
      GoRoute(
        name: RouteNames.detailPage,
        path: '/detailPage',
        pageBuilder: (context, state) {
          final args = state.extra! as Plants;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: Details(itemList: args),
          );
        },
      )
    ],
    errorBuilder: (context, state) => const ErrorRoute(),
    errorPageBuilder: (context, state) =>
        const MaterialPage(child: ErrorRoute()),
  );
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error - 400"),
        leading: IconButton(
          icon: IconButton(
            icon: Platform.isIOS
                ? const Icon(Icons.arrow_back_ios)
                : const Icon(Icons.arrow_back_outlined),
            onPressed: () => Navigator.pop(context),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          "Page Not Found....",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(scale: animation, child: child),
  );
}
