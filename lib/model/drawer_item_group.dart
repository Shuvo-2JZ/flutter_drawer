import 'package:flutter/material.dart';
import 'package:flutter_app/model/drawer_item.dart';

@immutable
class DrawerItemGroup {
  final String header;
  final List<DrawerItem> items;

  const DrawerItemGroup({
    required this.items,
    this.header = '',
  });
}
