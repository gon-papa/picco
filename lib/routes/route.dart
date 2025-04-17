import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:picco/main/favorite/page.dart';
import 'package:picco/main/main_scaffold.dart';
import 'package:picco/main/mypage/page.dart';
import 'package:picco/main/search/page.dart';
import 'package:picco/main/timeline/page.dart';

// ルートパス一覧を定義
const List<String> _locations = ['/home', '/search', '/favorite', '/mypage'];

// パス→インデックス
int _locationToIndex(String location) {
  final idx = _locations.indexOf(location);
  return idx >= 0 ? idx : 0;
}

// インデックス→パス
String _indexToLocation(int index) {
  return (index >= 0 && index < _locations.length)
      ? _locations[index]
      : _locations[0];
}

final goRouteProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: _locations[0],
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final currentIndex = _locationToIndex(state.uri.toString());
          return MainScaffold(
            currentIndex: currentIndex,
            onTap: (index) => context.go(_indexToLocation(index)),
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: _locations[0],
            name: 'home',
            pageBuilder:
                (context, state) =>
                    NoTransitionPage(child: const TimelinePage()),
          ),
          GoRoute(
            path: _locations[1],
            name: 'search',
            pageBuilder:
                (context, state) => NoTransitionPage(child: const SearchPage()),
          ),
          GoRoute(
            path: _locations[2],
            name: 'favorite',
            pageBuilder:
                (context, state) =>
                    NoTransitionPage(child: const FavoritePage()),
          ),
          GoRoute(
            path: _locations[3],
            name: 'mypage',
            pageBuilder:
                (context, state) => NoTransitionPage(child: const MyPage()),
          ),
        ],
      ),
    ],
  );
});
