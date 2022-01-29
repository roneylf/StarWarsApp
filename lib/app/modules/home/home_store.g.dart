// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$selectPageAtom = Atom(name: 'HomeStoreBase.selectPage');

  @override
  Pages get selectPage {
    _$selectPageAtom.reportRead();
    return super.selectPage;
  }

  @override
  set selectPage(Pages value) {
    _$selectPageAtom.reportWrite(value, super.selectPage, () {
      super.selectPage = value;
    });
  }

  @override
  String toString() {
    return '''
selectPage: ${selectPage}
    ''';
  }
}
