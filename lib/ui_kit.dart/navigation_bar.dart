import 'package:e_commerce/ui_kit.dart/navigation_bar_item.dart';
import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class BottomNavigationBar extends StatelessWidget {
  final List<NavigationBarItem> items;
  final int selectedIndex;
  final void Function(int index) onTap;
  const BottomNavigationBar({
    super.key,
    required this.items,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...items.asMap().entries.map((e) {
                return _NavigationItem(
                  title: e.value.title,
                  onTap: () => onTap(e.key),
                  notActivePath: e.value.notActivePath,
                  activePath: e.value.activePath,
                  isActive: e.key == selectedIndex,
                );
              }),
            ],
          ),
          //SizedBox(height: 33),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final void Function() onTap;
  final String notActivePath;
  final String activePath;
  final bool isActive;
  final String title;
  const _NavigationItem({
    super.key,
    required this.onTap,
    required this.notActivePath,

    required this.isActive,
    required this.activePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          U.Image.Icon(image: isActive ? activePath : notActivePath),
          SizedBox(height: 2),
          U.Text(
            title,
            fontSize: U.TextSize.s10,
            color: isActive ? U.Theme.primary : U.Theme.gray,
          ),
        ],
      ),
    );
  }
}
