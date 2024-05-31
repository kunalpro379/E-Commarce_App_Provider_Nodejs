import 'package:flutter/material.dart';

import '../models/dashboard_container.model.dart';

class DashboardContainerProvider extends ChangeNotifier {
  DashboardContainerModel dashboardContainerModelObj =
      DashboardContainerModel();

  void dispose() {
    super.dispose();
  }
}
