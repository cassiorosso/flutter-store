// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$darkThemeAtom = Atom(name: '_UserControllerBase.darkTheme');

  @override
  bool get darkTheme {
    _$darkThemeAtom.context.enforceReadPolicy(_$darkThemeAtom);
    _$darkThemeAtom.reportObserved();
    return super.darkTheme;
  }

  @override
  set darkTheme(bool value) {
    _$darkThemeAtom.context.conditionallyRunInAction(() {
      super.darkTheme = value;
      _$darkThemeAtom.reportChanged();
    }, _$darkThemeAtom, name: '${_$darkThemeAtom.name}_set');
  }

  final _$themeAppAtom = Atom(name: '_UserControllerBase.themeApp');

  @override
  ThemeData get themeApp {
    _$themeAppAtom.context.enforceReadPolicy(_$themeAppAtom);
    _$themeAppAtom.reportObserved();
    return super.themeApp;
  }

  @override
  set themeApp(ThemeData value) {
    _$themeAppAtom.context.conditionallyRunInAction(() {
      super.themeApp = value;
      _$themeAppAtom.reportChanged();
    }, _$themeAppAtom, name: '${_$themeAppAtom.name}_set');
  }

  final _$setThemeDataAsyncAction = AsyncAction('setThemeData');

  @override
  Future setThemeData() {
    return _$setThemeDataAsyncAction.run(() => super.setThemeData());
  }

  @override
  String toString() {
    final string =
        'darkTheme: ${darkTheme.toString()},themeApp: ${themeApp.toString()}';
    return '{$string}';
  }
}
