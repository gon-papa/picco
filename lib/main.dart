import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picco/routes/route.dart';
import 'package:picco/thema.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouteProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
