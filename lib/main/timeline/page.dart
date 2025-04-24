import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picco/theme.dart';

class TimelinePage extends ConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _TabBar();
  }
}

class _TabBar extends ConsumerWidget {
  const _TabBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final mode = ref.watch(modeProvider);
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: theme.onSurface.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(50), // 外枠の角丸
            ),
            child: TabBar(
              dividerColor: Colors.transparent, // タブ間の線の色
              indicator: BoxDecoration(
                gradient: AppGradients.getGradient(mode), // タブの背景色
                borderRadius: BorderRadius.circular(50), // indicator の角丸
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: theme.onSecondary,
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ), // 選択中文字色
              unselectedLabelStyle: TextStyle(
                fontSize: 14,
                color: theme.onSurface.withValues(alpha: 0.3),
              ),
              unselectedLabelColor: Colors.black, // 非選択文字色
              tabs: const [Tab(text: 'おすすめ'), Tab(text: 'フォロー中')],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                Center(child: Text('おすすめ')),
                Center(child: Text('フォロー中')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
