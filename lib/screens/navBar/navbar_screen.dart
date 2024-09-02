import 'package:document_analyzer/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatefulWidget {
  /// child UIs for the SideNavBar
  final Widget child;

  const NavBar({super.key, required this.child});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  /// property to get the list of menu items for side navbar
  Map<String, Widget> sideNavBarMenuData = const {
    'Dashboard': Icon(Icons.dashboard),
    'Customers': Icon(Icons.people),
    'Policies': Icon(Icons.policy),
    'Reports': Icon(Icons.report),
  };

  /// Method to handle onPressed when a sidebar menu item is clicked
  void _sideNavBarItemPressed(String title) {
    switch (title) {
      case 'Dashboard':
        context.go("/dashboard");
        break;
      case 'Customers':
        context.go("/call-customer");
        break;
      case 'Policies':
        break;
      case 'Reports':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ui;
  }

  Widget get ui {
    if (AppHelpers.getDevice(context) == Devices.webpage) {
      return _buildUIForWeb();
    }
    if (AppHelpers.getDevice(context) == Devices.mobile ||
        AppHelpers.getDevice(context) == Devices.smallMobile) {
      return _buildUIForMobile();
    }
    return _buildUIForWeb();
  }

  Scaffold _buildUIForMobile() {
    return const Scaffold();
  }

  Scaffold _buildUIForWeb() {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderUI(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSideNavBarUI(),
              Expanded(flex: 4, child: widget.child),
            ],
          ),
        ],
      ),
    );
  }

  /// Method to build side nav bar list UI
  List<Widget> _buildSideNavBarListUI() {
    List<Widget> iconsList = [];

    sideNavBarMenuData.forEach((title, icon) {
      iconsList.add(
        ListTile(
          leading: icon,
          title: Text(title),
          onTap: () => _sideNavBarItemPressed(title),
        ),
      );
    });

    return iconsList;
  }

  Expanded _buildSideNavBarUI() {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.grey200,
          height: MediaQuery.of(context).size.height * 0.92,
          child: Column(
            children: [
              const SizedBox(height: 20),
              ..._buildSideNavBarListUI(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildHeaderUI() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 60,
      color: AppColors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.person, size: 100, color: AppColors.white),
          Row(
            children: [
              Icon(Icons.notifications, color: AppColors.white),
              const SizedBox(width: 20),
              Icon(Icons.settings, color: AppColors.white),
              const SizedBox(width: 20),
              Icon(Icons.person, color: AppColors.white),
            ],
          )
        ],
      ),
    );
  }
}
