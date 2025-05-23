import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picco/routes/route.dart';
import 'package:picco/theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouteProvider);
    final mode = ref.watch(modeProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: mode == AppMode.female ? AppTheme.female : AppTheme.male,
      darkTheme: AppTheme.dark,
      themeMode: mode == AppMode.dark ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}
