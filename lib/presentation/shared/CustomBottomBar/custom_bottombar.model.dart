import 'package:flutter/cupertino.dart';
import 'package:shopping/presentation/shared/CustomBottomBar/CustomBottomBar.dart';

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.type,
  });

  final IconData icon;
  final IconData activeIcon;
  final String title;
  final BottomBarEnum type;
}
