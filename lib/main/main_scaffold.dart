import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picco/gen/assets.gen.dart';
import 'package:picco/main/mypage/page.dart';
import 'package:picco/main/timeline/page.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  static const List<Widget> _pages = [TimelinePage(), MyPage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    return MainScaffold(
      currentIndex: currentIndex,
      onTap: (index) => ref.read(currentIndexProvider.notifier).state = index,
      body: _pages[currentIndex],
    );
  }
}

class MainScaffold extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Widget body;

  const MainScaffold({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.body,
  });

  static const List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.timeline), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'MyPage'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.logo.logo.svg(width: 32, height: 32),
            Text(
              'Picco',
              style: TextStyle(
                color: theme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}

final currentIndexProvider = StateProvider<int>((ref) => 0);
