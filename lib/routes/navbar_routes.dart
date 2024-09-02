import 'package:document_analyzer/screens/navBar/customers/call_customer_screen.dart';
import 'package:document_analyzer/screens/screens.dart';
import 'package:document_analyzer/utils/utils.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> navbarRoutes = [
  GoRoute(
    path: "/dashboard",
    name: "dashboard",
    builder: (context, state) {
      return const DashboardPage();
    },
  ),
  ShellRoute(
    navigatorKey: AppHelpers.shellNavigatorKey,
    builder: (context, state, child) => CustomersPage(child: child),
    routes: [
      GoRoute(
        path: '/call-customer',
        name: "call-customer",
        builder: (context, state) => const CallCustomerPage(),
      ),
    ],
  ),
];
