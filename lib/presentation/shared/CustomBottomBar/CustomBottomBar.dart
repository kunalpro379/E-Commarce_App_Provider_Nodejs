import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping/presentation/shared/CustomBottomBar/custom_bottombar.provider.dart';

import 'custom_bottombar.model.dart';

enum BottomBarEnum { Home, Explore, Cart, Offer, Account }

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key, this.onChanged}) : super(key: key);
  final Function(BottomBarEnum)? onChanged;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: Icons.home,
      activeIcon: Icons.home_filled,
      title: 'Home',
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: Icons.explore,
      activeIcon: Icons.explore_outlined,
      title: 'Explore',
      type: BottomBarEnum.Explore,
    ),
    BottomMenuModel(
      icon: Icons.shopping_cart,
      activeIcon: Icons.shopping_cart_outlined,
      title: 'Cart',
      type: BottomBarEnum.Cart,
    ),
    BottomMenuModel(
      icon: Icons.local_offer,
      activeIcon: Icons.local_offer_outlined,
      title: 'Offer',
      type: BottomBarEnum.Offer,
    ),
    BottomMenuModel(
      icon: Icons.account_circle,
      activeIcon: Icons.account_circle_outlined,
      title: 'Account',
      type: BottomBarEnum.Account,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (context, bottomNavigationBarProvider, child) {
        final selectedIndex = bottomNavigationBarProvider.selectedIndex;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: double.maxFinite, child: Divider()),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              child: BottomNavigationBar(
                unselectedLabelStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
                selectedLabelStyle: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                currentIndex: selectedIndex,
                onTap: (index) {
                  bottomNavigationBarProvider.updateSelectedIndex(index);
                  if (widget.onChanged != null) {
                    widget.onChanged!(bottomMenuList[index].type);
                  }
                },
                items: bottomMenuList.map((menu) {
                  return BottomNavigationBarItem(
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 23.h,
                          width: 24.w,
                          child: Icon(
                            menu.icon,
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 5.h),
                        //   child: Text(menu.title),
                        // ),
                      ],
                    ),
                    label: menu.title,
                    // Provide a label for each item

                    activeIcon: Icon(menu.activeIcon),
                  );
                }).toList(),
              ),
            )
          ],
        );
      },
    );
  }
}
