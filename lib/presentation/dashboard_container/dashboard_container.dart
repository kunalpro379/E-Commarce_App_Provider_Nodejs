import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/presentation/dashboard_container/provider/dashboard_container.provider.dart';

import '../../routes/app_routes.dart';
import '../dashboard_page/dash_board.page.dart';
import '../shared/CustomBottomBar/CustomBottomBar.dart';
import '../shared/bottom_nav.dart';

class DashboardContainer extends StatefulWidget {
  const DashboardContainer({super.key});

  @override
  State<DashboardContainer> createState() => _DashboardContainerState();

  static ChangeNotifierProvider<DashboardContainerProvider> builder(
      BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardContainerProvider(),
      child: DashboardContainer(),
    );
  }
}

class _DashboardContainerState extends State<DashboardContainer> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.dashboard_page,
          onGenerateRoute: (routeSettings) {
            return PageRouteBuilder(
              pageBuilder: (ctx, animation, secondaryAnimation) =>
                  getCurrentPage(routeSettings.name),
              transitionDuration: Duration(seconds: 0),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboard_page;
      case BottomBarEnum.Explore:
        return AppRoutes.explore_page;
      case BottomBarEnum.Cart:
        return AppRoutes.cart_page;
      case BottomBarEnum.Offer:
        return AppRoutes.offer_page;
      case BottomBarEnum.Account:
        return AppRoutes.profile_page;
      default:
        return AppRoutes.dashboard_page;
    }
  }

  Widget getCurrentPage(String? currentRoute) {
    switch (currentRoute) {
      case AppRoutes.dashboard_page:
        return DashBoardPage();
      // Add other cases for different pages
      default:
        return DashBoardPage();
    }
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        String route = getCurrentRoute(type);
        navigatorKey.currentState?.pushNamed(route);
      },
    );
  }
}
