import 'package:flutter/widgets.dart';

///
/// フレーバー種別
///
enum FlavorType {
  develop, // 開発
  staging, // テスト
  production // 本番
}

/// 　
/// フレーバープロバイダ
///
class FlavorProvider extends InheritedWidget {
  final FlavorType flavor;

  /// コンストラクタ
  /// flavor: フレーバー種別
  /// child: Widget
  FlavorProvider({
    Key key,
    @required this.flavor,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static FlavorType of(BuildContext context) => (context
      .getElementForInheritedWidgetOfExactType<FlavorProvider>()
      .widget as FlavorProvider)
      .flavor;

  @override
  bool updateShouldNotify(FlavorProvider oldWidget) => false;
}

///
/// フレーバー
///
class Flavor {
  static FlavorType type; // フレーバー種別
}